using UnityEngine;

public class Examinable : MonoBehaviour
{
    [Header("Bottom Prompt (shown only while examining)")]
    public Sprite bottomPromptSprite;

    [Header("Move / Rotate")]
    public float moveSpeed = 12f;
    public float rotateSpeed = 140f;

    [Header("Zoom (Scroll)")]
    public float scrollZoomSpeed = 0.25f;
    public float minDistance = 0.25f;
    public float maxDistance = 1.2f;

    [HideInInspector] public bool isBeingExamined;

    private Transform originalParent;
    private Vector3 originalPos;
    private Quaternion originalRot;
    private Vector3 originalScale;
    private int originalLayer;

    private Rigidbody rb;
    private Collider[] cols;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        cols = GetComponentsInChildren<Collider>();
    }

    public void BeginExamine(Transform examinePoint)
    {
        if (isBeingExamined) return;
        isBeingExamined = true;

        originalParent = transform.parent;
        originalPos = transform.position;
        originalRot = transform.rotation;
        originalScale = transform.localScale;
        originalLayer = gameObject.layer;

        // Put on Examine layer so only ExamineCamera renders it (Fix A setup)
        int examineLayer = LayerMask.NameToLayer("Examine");
        if (examineLayer != -1)
            SetLayerRecursively(gameObject, examineLayer);

        // Disable physics/colliders while examining
        if (rb != null)
        {
            rb.isKinematic = true;
            rb.linearVelocity = Vector3.zero;
            rb.angularVelocity = Vector3.zero;
        }
        foreach (var c in cols) c.enabled = false;

        transform.parent = null;
    }

    public void EndExamine()
    {
        if (!isBeingExamined) return;
        isBeingExamined = false;

        transform.parent = originalParent;
        transform.position = originalPos;
        transform.rotation = originalRot;
        transform.localScale = originalScale;

        foreach (var c in cols) c.enabled = true;
        if (rb != null) rb.isKinematic = false;

        SetLayerRecursively(gameObject, originalLayer);
    }

    public void ExamineUpdate(Transform examinePoint, Camera cam)
    {
        // Move toward the point smoothly
        transform.position = Vector3.Lerp(transform.position, examinePoint.position, Time.deltaTime * moveSpeed);

        // Rotate with mouse drag (hold left mouse)
        if (Input.GetMouseButton(0))
        {
            float mx = Input.GetAxis("Mouse X") * rotateSpeed * Time.deltaTime;
            float my = Input.GetAxis("Mouse Y") * rotateSpeed * Time.deltaTime;

            transform.Rotate(cam.transform.up, -mx, Space.World);
            transform.Rotate(cam.transform.right, my, Space.World);
        }

        // Scroll zoom changes the examinePoint distance (not object scale)
        float scroll = Input.mouseScrollDelta.y;
        if (Mathf.Abs(scroll) > 0.01f)
        {
            Vector3 dir = (examinePoint.position - cam.transform.position).normalized;
            float currentDist = Vector3.Distance(cam.transform.position, examinePoint.position);
            float newDist = Mathf.Clamp(currentDist - scroll * scrollZoomSpeed, minDistance, maxDistance);
            examinePoint.position = cam.transform.position + dir * newDist;
        }
    }

    private void SetLayerRecursively(GameObject obj, int newLayer)
    {
        obj.layer = newLayer;
        foreach (Transform child in obj.transform)
            SetLayerRecursively(child.gameObject, newLayer);
    }
}

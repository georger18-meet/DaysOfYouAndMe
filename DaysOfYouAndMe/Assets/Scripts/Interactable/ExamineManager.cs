using UnityEngine;

public class ExamineManager : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private Camera mainCamera;
    [SerializeField] private Camera examineCamera;   // Fix A: renders to Game view (TargetTexture = None)
    [SerializeField] private Transform examinePoint;

    [Header("Bottom Prompt UI (only while examining)")]
    [SerializeField] private BottomPromptUI bottomPromptUI;

    [Header("Raycast")]
    [SerializeField] private float interactDistance = 3f;
    [SerializeField] private LayerMask interactMask;

    [Header("Input")]
    [SerializeField] private KeyCode interactKey = KeyCode.E;
    [SerializeField] private KeyCode exitKey = KeyCode.Escape;

    private Examinable current;
    private bool examining;
    private int savedMainCullingMask;

    public bool IsExamining() => examining;

    private void Start()
    {
        if (mainCamera == null) mainCamera = Camera.main;

        if (mainCamera != null)
            savedMainCullingMask = mainCamera.cullingMask;

        if (examineCamera != null)
            examineCamera.gameObject.SetActive(false);
    }

    private void Update()
    {
        if (!examining)
        {
            if (Input.GetKeyDown(interactKey))
                TryStartExamine();
        }
        else
        {
            if (current != null)
                current.ExamineUpdate(examinePoint, mainCamera);

            if (Input.GetKeyDown(exitKey) || Input.GetKeyDown(interactKey))
                StopExamine();
        }
    }

    private void TryStartExamine()
    {
        Ray ray = new Ray(mainCamera.transform.position, mainCamera.transform.forward);

        if (Physics.Raycast(ray, out RaycastHit hit, interactDistance, interactMask))
        {
            Examinable ex = hit.collider.GetComponentInParent<Examinable>();
            if (ex == null) return;

            current = ex;
            StartExamine();
        }
    }

    private void StartExamine()
    {
        examining = true;

        current.BeginExamine(examinePoint);

        // Show bottom prompt ONLY after interacting (now)
        if (bottomPromptUI != null && current.bottomPromptSprite != null)
            bottomPromptUI.Show(current.bottomPromptSprite);

        // Cursor for examining
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        // Hide Examine layer from main camera
        int examineLayer = LayerMask.NameToLayer("Examine");
        if (mainCamera != null && examineLayer != -1)
            mainCamera.cullingMask &= ~(1 << examineLayer);

        // Enable examine camera (Fix A: should render on top; TargetTexture must be None)
        if (examineCamera != null)
        {
            examineCamera.targetTexture = null;
            examineCamera.gameObject.SetActive(true);
        }
    }

    private void StopExamine()
    {
        examining = false;

        // Hide bottom prompt when exiting examine
        if (bottomPromptUI != null)
            bottomPromptUI.Hide();

        if (current != null)
        {
            current.EndExamine();
            current = null;
        }

        // Restore main camera mask
        if (mainCamera != null)
            mainCamera.cullingMask = savedMainCullingMask;

        // Disable examine camera
        if (examineCamera != null)
            examineCamera.gameObject.SetActive(false);

        // Return to FPS cursor state
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }
}

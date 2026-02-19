using UnityEngine;

public class NoteInteractor : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private Camera cam;
    [SerializeField] private NoteUI noteUI;

    [Header("Locks (optional but recommended)")]
    [SerializeField] private ExamineManager examineManager; // so E doesn't open notes while examining

    [Header("Interaction Settings")]
    [SerializeField] private float interactDistance = 3f;
    [SerializeField] private LayerMask interactMask;

    [Header("Input")]
    [SerializeField] private KeyCode interactKey = KeyCode.E;
    [SerializeField] private KeyCode closeKey = KeyCode.Escape;

    void Start()
    {
        if (cam == null)
            cam = Camera.main;
    }

    void Update()
    {
        if (cam == null || noteUI == null)
            return; 

        // If examining, don't allow note interaction
        if (examineManager != null && examineManager.IsExamining())
            return;

        Ray ray = new Ray(cam.transform.position, cam.transform.forward);

        // Raycast to find a note
        bool hitSomething = Physics.Raycast(ray, out RaycastHit hit, interactDistance, interactMask);

        // Debug ray
        Debug.DrawRay(ray.origin, ray.direction * interactDistance, hitSomething ? Color.green : Color.red);

        // CLOSE NOTE
        if (noteUI.IsOpen)
        {
            if (Input.GetKeyDown(closeKey) || Input.GetKeyDown(interactKey))
            {
                noteUI.Close();
            }
            return;
        }

        // OPEN NOTE
        if (Input.GetKeyDown(interactKey) && hitSomething)
        {
            NoteItem item = hit.collider.GetComponentInParent<NoteItem>();

            if (item != null && item.noteSprite != null)
            {
                noteUI.Open(item, item.gameObject); // <-- IMPORTANT
            }
        }

    }
}

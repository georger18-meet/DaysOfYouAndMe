using UnityEngine;

public class NoteInteractor : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private Camera cam;
    [SerializeField] private NoteUI noteUI;

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

        Ray ray = new Ray(cam.transform.position, cam.transform.forward);

        // ALWAYS draw debug ray in Scene view
        bool hitSomething = Physics.Raycast(ray, out RaycastHit hit, interactDistance, interactMask);

        if (hitSomething)
            Debug.DrawRay(ray.origin, ray.direction * interactDistance, Color.green);
        else
            Debug.DrawRay(ray.origin, ray.direction * interactDistance, Color.red);


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
                noteUI.Open(item);
            }
        }

      


    }
}

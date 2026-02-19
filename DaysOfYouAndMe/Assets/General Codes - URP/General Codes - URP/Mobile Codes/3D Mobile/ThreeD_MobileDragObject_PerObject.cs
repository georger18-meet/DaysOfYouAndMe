using UnityEngine;

[RequireComponent (typeof(Rigidbody))]

public class ThreeD_MobileDragObject_PerObject : MonoBehaviour
{
    private Camera mainCamera;
    private bool isDragging = false;
    private Rigidbody rb;
    public LayerMask dontColliedLayerMask; // Specify the layer mask for objects you want to avoid

    void Start()
    {
        mainCamera = Camera.main;
        rb = GetComponent<Rigidbody>();
        rb.isKinematic = true;
    }

    void Update()
    {
        if (Input.GetMouseButtonDown(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began))
        {
            RaycastHit hit;
            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);

            if (Physics.Raycast(ray, out hit))
            {
                if (hit.collider.gameObject == gameObject) // Check if the raycast hits this object
                {
                    isDragging = true;
                }
            }
        }

        if (Input.GetMouseButtonUp(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Canceled))
        {
            isDragging = false;
        }

        if (isDragging)
        {
            // Calculate the position of the object based on mouse position
            Plane plane = new Plane(Vector3.up, transform.position);
            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
            float distance;
            if (plane.Raycast(ray, out distance))
            {
                Vector3 targetPosition = ray.GetPoint(distance);

                // Check for collisions with objects on the specified layer
                Collider[] colliders = Physics.OverlapSphere(targetPosition, transform.localScale.x / 2, dontColliedLayerMask);
                if (colliders.Length == 0)
                {
                    rb.MovePosition(targetPosition);
                }
            }
        }
    }
}

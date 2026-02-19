using UnityEngine;
using UnityEngine.EventSystems;

// Your camera must be of type Orthographic in order for this script to work!

public class OrthographicCameraController : MonoBehaviour
{
    public float dragSpeed = 2.0f;
    public float edgeScrollSpeed = 10.0f;
    public float zoomSpeed = 1.0f;

    private Camera mainCamera;

    private void Start()
    {
        mainCamera = Camera.main;
        mainCamera.orthographic = true; // Set the camera to orthographic
        Cursor.lockState = CursorLockMode.Confined;
    }

    private void Update()
    {
        // Check if mouse pointer is over UI elements
        if (EventSystem.current.IsPointerOverGameObject())
        {
            return;
        }

        // Drag camera by holding down mouse button
        if (Input.GetMouseButton(2))
        {
            float h = dragSpeed * Input.GetAxis("Mouse X");
            float v = dragSpeed * Input.GetAxis("Mouse Y");
            transform.Translate(-h, -v, 0);
        }

        // Move camera when pointer is near edges of the screen
        Vector3 mousePos = Input.mousePosition;
        float screenWidth = Screen.width;
        float screenHeight = Screen.height;

        if (mousePos.x < edgeScrollSpeed)
        {
            transform.Translate(Vector3.left * Time.deltaTime * edgeScrollSpeed);
        }
        else if (mousePos.x > screenWidth - edgeScrollSpeed)
        {
            transform.Translate(Vector3.right * Time.deltaTime * edgeScrollSpeed);
        }

        if (mousePos.y < edgeScrollSpeed)
        {
            transform.Translate(Vector3.down * Time.deltaTime * edgeScrollSpeed);
        }
        else if (mousePos.y > screenHeight - edgeScrollSpeed)
        {
            transform.Translate(Vector3.up * Time.deltaTime * edgeScrollSpeed);
        }

        // Zoom using mouse scroll wheel
        float scroll = Input.GetAxis("Mouse ScrollWheel");
        mainCamera.orthographicSize += -scroll * zoomSpeed;

        // Limit zoom range
        mainCamera.orthographicSize = Mathf.Clamp(mainCamera.orthographicSize, 1.0f, 100.0f);
    }
}

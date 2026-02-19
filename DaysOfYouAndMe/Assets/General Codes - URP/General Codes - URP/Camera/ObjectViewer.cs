using UnityEngine;

public class ObjectViewer : MonoBehaviour
{
    public Transform targetObject;
    public float rotationSpeed = 1.0f;
    public float zoomSpeed = 4.0f;
    public KeyCode chooseKey = KeyCode.Mouse1;
    public float minZoomDistance = 1.0f;
    public float maxZoomDistance = 100.0f;
    public float moveSpeed = 0.1f; // Speed of camera movement
    private Vector3 initialCameraPosition;

    private Transform cameraTransform;
    private Vector3 lastMousePosition;
    private bool isMoving = false;
    private bool setTargetObject = false;
    private Vector3 middleMouseInitialClickPosition;
    private float lastClickTime = 0f;
    public float doubleClickTime = 0.3f; // Maximum time between two clicks to register as a double-click

    private Vector3 initialTargetPosition;
    private Quaternion initialTargetRotation;

    private void Start()
    {
        cameraTransform = transform;
        lastMousePosition = Input.mousePosition;
        initialCameraPosition = cameraTransform.position;
        initialTargetPosition = targetObject.position;
        initialTargetRotation = targetObject.rotation;
    }

    private void Update()
    {
        // Rotate the camera around the target object using chooseKey
        if (Input.GetKey(chooseKey))
        {
            Vector3 deltaMouse = Input.mousePosition - lastMousePosition;
            float rotationX = -deltaMouse.y * rotationSpeed; // Invert Y-axis
            float rotationY = deltaMouse.x * rotationSpeed; // Invert X-axis

            cameraTransform.RotateAround(targetObject.position, Vector3.up, rotationY);
            cameraTransform.RotateAround(targetObject.position, cameraTransform.right, rotationX);
        }

        // Check for double click on the chooseKey to reset targetObject's transform and camera position
        if (Input.GetKeyDown(chooseKey))
        {
            // Check for double click
            if (Time.time - lastClickTime < doubleClickTime)
            {
                ResetTargetObjectTransform();
                ResetCameraPosition();
            }

            lastClickTime = Time.time;
        }

        // Check for middle mouse button down to set targetObject's position or move across the screen
        if (Input.GetMouseButtonDown(2))
        {
            isMoving = true;

            if (!setTargetObject)
            {
                middleMouseInitialClickPosition = Input.mousePosition;
                setTargetObject = true;
            }
        }

        // Check for middle mouse button release to stop setting targetObject's position or moving across the screen
        if (Input.GetMouseButtonUp(2))
        {
            isMoving = false;
            setTargetObject = false;
        }

        // Move camera based on cursor movement while middle mouse button is held down
        if (isMoving)
        {
            float mouseX = Input.GetAxis("Mouse X");
            float mouseY = Input.GetAxis("Mouse Y");

            Vector3 moveDirection = -cameraTransform.right * mouseX * moveSpeed; // Invert X-axis
            moveDirection += cameraTransform.up * mouseY * moveSpeed;

            cameraTransform.position += moveDirection;
        }

        // Set targetObject's position to where the middle mouse button was initially clicked
        if (setTargetObject)
        {
            Ray ray = Camera.main.ScreenPointToRay(middleMouseInitialClickPosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                targetObject.position = hit.point;
            }
        }

        // Zoom in/out
        float scrollWheel = Input.GetAxis("Mouse ScrollWheel");
        float invertedZoomAmount = -scrollWheel * zoomSpeed;

        if (invertedZoomAmount != 0)
        {
            Vector3 zoomDirection = (cameraTransform.position - targetObject.position).normalized;
            float newDistance = Vector3.Distance(cameraTransform.position, targetObject.position) + invertedZoomAmount;
            newDistance = Mathf.Clamp(newDistance, minZoomDistance, maxZoomDistance);
            cameraTransform.position = targetObject.position + zoomDirection * newDistance;
        }

        lastMousePosition = Input.mousePosition;
    }

    private void ResetTargetObjectTransform()
    {
        // Reset targetObject's transform to its initial state
        targetObject.position = initialTargetPosition;
        targetObject.rotation = initialTargetRotation;
    }

    private void ResetCameraPosition()
    {
        // Reset camera position to its initial state
        cameraTransform.position = initialCameraPosition;
        cameraTransform.LookAt(targetObject.position);
    }
}
using UnityEngine;

public class ThirdPersonCamera : MonoBehaviour
{
    public Transform target; // Character to follow
    public float followSpeed = 5f; // Speed of camera follow
    public float rotationSpeed = 5.0f; // Speed of camera rotation

    public float distance = 3.0f; // Distance from the character
    public float height = 1f; // Height offset from the character's position

    private float currentRotationAngle = 0f; // Current angle of rotation
    private Vector3 initialPosition; // Initial position of the camera
    private bool isMoving = false; // Flag to track if player is moving

    private void Start()
    {
        // Store initial position of the camera
        initialPosition = transform.position;
    }

    private void LateUpdate()
    {
        // Check if target is null to avoid errors
        if (target == null)
            return;

        // Update camera position if the player moves
        if (!isMoving && (target.position - initialPosition).sqrMagnitude > 0.01f)
            isMoving = true;

        // Check for mouse input for rotation
        if (Input.GetMouseButton(0))
        {
            // Rotate around the character based on mouse movement
            currentRotationAngle += Input.GetAxis("Mouse X") * rotationSpeed;
        }

        // Smoothly rotate the camera around the character
        float targetRotationAngle = currentRotationAngle;
        Quaternion targetRotation = Quaternion.Euler(0f, target.eulerAngles.y + targetRotationAngle, 0f);
        Vector3 direction = new Vector3(0, height, -distance);
        Vector3 rotatedDirection = targetRotation * direction;
        Vector3 targetPosition = target.position + rotatedDirection;

        if (!isMoving)
        {
            // Smoothly move the camera to the initial position if it's not moving yet
            targetPosition = initialPosition;
        }

        // Update the camera's position and rotation
        transform.position = Vector3.Lerp(transform.position, targetPosition, Time.deltaTime * followSpeed);
        transform.rotation = Quaternion.Lerp(transform.rotation, targetRotation, Time.deltaTime * followSpeed);
    }
}

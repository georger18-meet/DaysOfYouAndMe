using UnityEngine;

public class Billboarding : MonoBehaviour
{
    [Tooltip("Enable constraint to billboarding on the y-axis only.")]
    public bool constrainToYAxis = true;

    private float initialRotation;

    void Start()
    {
        // Store the initial rotation around the y-axis
        initialRotation = transform.eulerAngles.y;
    }

    void LateUpdate()
    {
        // Get the direction from the object to the camera
        Vector3 cameraDirection = Camera.main.transform.position - transform.position;

        // Project the direction onto the XZ plane
        if (constrainToYAxis)
            cameraDirection.y = 0;

        // Make the object face the camera only along the y-axis
        Quaternion targetRotation = Quaternion.LookRotation(cameraDirection.normalized, Vector3.up);

        // Apply the initial rotation around the y-axis
        targetRotation *= Quaternion.Euler(0, initialRotation, 0);

        // Set the object's rotation
        transform.rotation = targetRotation;
    }
}
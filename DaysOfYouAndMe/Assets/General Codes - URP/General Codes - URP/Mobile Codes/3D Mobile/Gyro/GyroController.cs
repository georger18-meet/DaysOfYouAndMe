using UnityEngine;

public enum DeviceOrientation
{
    Portrait,
    Landscape
}

public class GyroController : MonoBehaviour
{
    private Rigidbody rb;
    public DeviceOrientation deviceOrientation;    

    void Start()
    {
        rb = GetComponent<Rigidbody>();

        // Enable the gyroscope
        Input.gyro.enabled = true;

        // Determine the initial orientation of the device
        SetDeviceOrientation();
    }

    void FixedUpdate()
    {
        // Get the gyroscope input
        Vector3 gyroInput = Input.gyro.rotationRateUnbiased;

        // Adjust the input based on the device orientation
        float speed = 10f;
        Vector3 movement;

        switch (deviceOrientation)
        {
            case DeviceOrientation.Portrait:
                movement = new Vector3(-gyroInput.y, 0, gyroInput.x);
                break;
            case DeviceOrientation.Landscape:
                movement = new Vector3(gyroInput.x, 0, gyroInput.y);
                break;
            default:
                movement = Vector3.zero;
                break;
        }

        // Apply the movement to the Rigidbody
        rb.AddForce(movement * speed);
    }

    // Method to determine the device orientation
    void SetDeviceOrientation()
    {
        if (Screen.height > Screen.width)
        {
            deviceOrientation = DeviceOrientation.Portrait;
        }
        else
        {
            deviceOrientation = DeviceOrientation.Landscape;
        }
    }
}

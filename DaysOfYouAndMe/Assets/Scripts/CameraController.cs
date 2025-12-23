using UnityEngine;

public class CameraController : MonoBehaviour
{
    public float _mouseSensitivity = 100f;
    [SerializeField] private Transform _player;
    float _xRotation = 0f;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        float mouseX = Input.GetAxis("Mouse X") * _mouseSensitivity * Time.deltaTime;
        float mouseY = Input.GetAxis("Mouse Y") * _mouseSensitivity * Time.deltaTime;

        _xRotation -= mouseY;
        _xRotation = Mathf.Clamp(_xRotation, -90, 90);

        transform.localRotation = Quaternion.Euler(_xRotation, 0, 0);
        _player.Rotate(Vector3.up * mouseX);
    }
}

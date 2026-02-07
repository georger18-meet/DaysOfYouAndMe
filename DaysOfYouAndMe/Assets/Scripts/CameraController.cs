using UnityEngine;

public class CameraController : MonoBehaviour
{
    [Header("Sensitivity")]
    public float _mouseSensitivity = 100f;

    [Header("Player Body")]
    [SerializeField] private Transform _player;

    [Header("Locks")]
    [SerializeField] private ExamineManager _examineManager;
    [SerializeField] private NoteUI _noteUI;

    private float _xRotation = 0f;

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    void Update()
    {
        bool lockedByExamine = (_examineManager != null && _examineManager.IsExamining());
        bool lockedByNote = (_noteUI != null && _noteUI.IsOpen);

        // Lock camera look during examining OR note reading
        if (lockedByExamine || lockedByNote)
            return;

        float mouseX = Input.GetAxis("Mouse X") * _mouseSensitivity * Time.deltaTime;
        float mouseY = Input.GetAxis("Mouse Y") * _mouseSensitivity * Time.deltaTime;

        _xRotation -= mouseY;
        _xRotation = Mathf.Clamp(_xRotation, -90f, 90f);

        transform.localRotation = Quaternion.Euler(_xRotation, 0f, 0f);
        _player.Rotate(Vector3.up * mouseX);
    }
}
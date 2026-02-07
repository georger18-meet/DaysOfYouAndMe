using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class PlayerController : MonoBehaviour
{
    private CharacterController _charCon;

    [Header("Movement")]
    [SerializeField] private float _moveSpeed = 10f;

    [Header("Gravity")]
    [SerializeField] private float _gravity = -9.81f;

    [Header("Ground Check")]
    [SerializeField] private Transform _groundCheck;
    [SerializeField] private float _groundDistance = 0.4f;
    [SerializeField] private LayerMask _groundMask;

    [Header("Locks")]
    [SerializeField] private NoteUI _noteUI;                 // UIManager (NoteUI)
    [SerializeField] private ExamineManager _examineManager; // ExamineManager

    private Vector3 _velocity;
    private bool _isGrounded;

    public bool IsGrounded => _isGrounded;
    public Vector3 HorizontalVelocity
    {
        get
        {
            Vector3 v = _charCon.velocity;
            v.y = 0f;
            return v;
        }
    }

    void Start()
    {
        _charCon = GetComponent<CharacterController>();
    }

    void Update()
    {
        GroundCheck();

        bool lockedByNote = (_noteUI != null && _noteUI.IsOpen);
        bool lockedByExamine = (_examineManager != null && _examineManager.IsExamining());

        // Lock movement during note reading OR examining
        if (lockedByNote || lockedByExamine)
        {
            // Stop horizontal movement input
            _charCon.Move(Vector3.zero);

            // Still apply gravity so you don't hang mid-air
            Gravity();
            return;
        }

        Movement();
        Gravity();
    }

    private void GroundCheck()
    {
        _isGrounded = Physics.CheckSphere(_groundCheck.position, _groundDistance, _groundMask);
        if (_isGrounded && _velocity.y < 0f)
            _velocity.y = -2f;
    }

    private void Movement()
    {
        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");

        Vector3 move = transform.right * x + transform.forward * z;
        _charCon.Move(move * _moveSpeed * Time.deltaTime);
    }

    private void Gravity()
    {
        _velocity.y += _gravity * Time.deltaTime;
        _charCon.Move(_velocity * Time.deltaTime);
    }

    private void OnDrawGizmosSelected()
    {
        if (!_groundCheck) return;
        Gizmos.color = new Color(1, 1, 0, 0.4f);
        Gizmos.DrawSphere(_groundCheck.position, _groundDistance);
    }
}
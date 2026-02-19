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

    [Header("Room Dissolve")]
    [SerializeField] private KeyCode _dissolveKey = KeyCode.C;
    private DissolveGroup _activeDissolveGroup;

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

        // Trigger dissolve for the currently active room/group only
        if (Input.GetKeyDown(_dissolveKey) && _activeDissolveGroup != null)
        {
            _activeDissolveGroup.Reveal();
        }

        // Lock movement while reading a letter OR examining OR journal open
        bool lockedByNote = (_noteUI != null && _noteUI.IsOpen);
        bool lockedByExamine = (_examineManager != null && _examineManager.IsExamining());
        bool locked = lockedByNote || lockedByExamine;

        if (locked)
        {
            // Stop horizontal input movement; keep gravity so you don't float mid-air
            _charCon.Move(Vector3.zero);
            Gravity();
            return;
        }

        Movement();
        Gravity();
    }

    public void SetActiveDissolveGroup(DissolveGroup group)
    {
        _activeDissolveGroup = group;
    }

    public void ClearActiveDissolveGroup(DissolveGroup group)
    {
        if (_activeDissolveGroup == group)
            _activeDissolveGroup = null;
    }

    private void GroundCheck()
    {
        if (_groundCheck == null) return;

        _isGrounded = Physics.CheckSphere(_groundCheck.position, _groundDistance, _groundMask);
        if (_isGrounded && _velocity.y < 0f)
            _velocity.y = -2f; // keeps you “stuck” to ground
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

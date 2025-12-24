using System.Drawing;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private CharacterController _charCon;

    public float _moveSpeed = 10f;
    public float _gravityMod = -9.81f;

    [SerializeField] private Transform _groundCheck;
    [SerializeField] private float _groundDistance = 0.4f;
    [SerializeField] private LayerMask _groundMask;

    private Vector3 _velocity;
    private bool _isGrounded;


    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        _charCon = GetComponent<CharacterController>();
    }

    // Update is called once per frame
    void Update()
    {
        Movement();
        Gravity();
    }


    private void Movement()
    {
        Vector2 moveAxis = new Vector2(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));

        Vector3 movement = transform.right * moveAxis.x + transform.forward * moveAxis.y;

        _charCon.Move(movement * _moveSpeed * Time.deltaTime);
    }

    private void Gravity()
    {
        _isGrounded = Physics.CheckSphere(_groundCheck.position, _groundDistance, _groundMask);

        if (_isGrounded && _velocity.y < 0)
        {
            _velocity.y = -2f;
        }

        _velocity.y += _gravityMod * Time.deltaTime;

        _charCon.Move(_velocity * Time.deltaTime);
    }

    private void OnDrawGizmosSelected()
    {
        if (_isGrounded)
        {
            Gizmos.color = new UnityEngine.Color(0, 1, 0, 0.5f);
        }
        else
        {
            Gizmos.color = new UnityEngine.Color(0, 1, 0, 0.5f);
        }
        Gizmos.DrawSphere(_groundCheck.position, _groundDistance);
    }
}

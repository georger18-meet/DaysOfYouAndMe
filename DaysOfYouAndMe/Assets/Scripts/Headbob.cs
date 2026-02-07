using UnityEngine;

public class HeadBob : MonoBehaviour
{
    [Header("Refs")]
    [SerializeField] private CharacterController controller;

    [Header("Ground Check (match PlayerController)")]
    [SerializeField] private Transform groundCheck;
    [SerializeField] private float groundDistance = 0.4f;
    [SerializeField] private LayerMask groundMask;

    [Header("Settings")]
    [SerializeField] private float frequency = 9f;
    [SerializeField] private float amplitude = 0.06f;
    [SerializeField] private float returnSpeed = 14f;

    [Header("Debug")]
    [SerializeField] private bool forceBobAlways = false;

    private Vector3 startLocalPos;
    private float t;

    void Start()
    {
        startLocalPos = transform.localPosition;
        if (!controller) controller = GetComponentInParent<CharacterController>();
    }

    void LateUpdate()
    {
        if (!controller || !groundCheck) return;

        bool grounded = Physics.CheckSphere(groundCheck.position, groundDistance, groundMask);

        float inputX = Input.GetAxisRaw("Horizontal");
        float inputZ = Input.GetAxisRaw("Vertical");
        float speed = new Vector2(inputX, inputZ).magnitude;



        bool shouldBob = forceBobAlways || (grounded && speed > 0.1f);

        if (!shouldBob)
        {
            t = 0f;
            transform.localPosition = Vector3.Lerp(transform.localPosition, startLocalPos, returnSpeed * Time.deltaTime);
            return;
        }

        t += Time.deltaTime * frequency;

        float y = Mathf.Sin(t) * amplitude;
        float x = Mathf.Cos(t * 0.5f) * (amplitude * 0.5f);

        transform.localPosition = startLocalPos + new Vector3(x, y, 0f);
    }
}

using UnityEditor;
using UnityEngine;

public class TwoD_PlayerScript_Animations : MonoBehaviour
{
    [Header("Movement")]
    public float moveSpeed = 15f;
    public string AnimatorMoveFloatName = "Move";
    public float AnimatorSmoothBlendTree = 0.005f;
    private float moveInput;

    [Header("Keybinds")]
    //public KeyCode runKey = KeyCode.LeftShift;
    public KeyCode jumpKey = KeyCode.Space;
    public KeyCode attackKey = KeyCode.Mouse1;

    [Header("Jumping")]
    public float jumpForce = 25f;
    public LayerMask groundLayer;
    public string AnimatorJumpingTriggerName = "isJumping";
    private bool isGrounded;
    private float groundDistance = 3f;

    [Header("Attacking Example")]
    public string AnimatorAttackingTriggerName = "isAttacking";      

    private SpriteRenderer spriteRenderer;
    private Rigidbody2D rb;
    private Animator anim;    

    private void Start()
    {
        // Get components
        rb = GetComponent<Rigidbody2D>();
        spriteRenderer = GetComponent<SpriteRenderer>();
        anim = GetComponent<Animator>();

        // Tweaking Rigidbody2D variables (delete if needed)
        rb.interpolation = RigidbodyInterpolation2D.Interpolate;
        rb.gravityScale = 10.0f;
    }

    private void Update()
    {
        // Check if the player is grounded
        isGrounded = Physics2D.Raycast(transform.position, Vector2.down, groundDistance, groundLayer);

        // Get input from horizontal axis
        moveInput = Input.GetAxisRaw("Horizontal");

        // Check for jump input
        if (Input.GetKeyDown(jumpKey) && isGrounded)
        {
           Jump();
        }

        // Flip the sprite based on the movement direction
        if (moveInput != 0)
        {
            if (moveInput > 0)
            {
            // Move right, flip sprite to face right
            spriteRenderer.flipX = false;
            }
            else
            {
            // Move left, flip sprite to face left
            spriteRenderer.flipX = true;
            }
        }

        // attacking example - can be any kind of animation...
        AttackingAnimation();
    }

    private void FixedUpdate()
    {
        // Move the player horizontally
        rb.linearVelocity = new Vector2(moveInput * moveSpeed, rb.linearVelocity.y);
        // change walking & running animations according to movement speed
        anim.SetFloat(AnimatorMoveFloatName, rb.linearVelocity.magnitude, AnimatorSmoothBlendTree, 0.5f * Time.deltaTime);
    }

    private void Jump()
    {
        // "Reset" vertical velocity
        rb.linearVelocity = new Vector2(rb.linearVelocity.x, 0f);
        // Apply vertical force to jump
        rb.linearVelocity = new Vector2(rb.linearVelocity.x, jumpForce);
        // Jumping Animation
        anim.SetTrigger(AnimatorJumpingTriggerName);
    }

    private void OnDrawGizmos()
    {   
        // Draw Ground checking line
        Gizmos.color = Color.yellow;
        Gizmos.DrawRay(transform.position, Vector2.down * groundDistance);
    }
    private void AttackingAnimation()
    {
        if (Input.GetKeyDown(attackKey))
        {
            anim.SetTrigger(AnimatorAttackingTriggerName);
        }
    }
}


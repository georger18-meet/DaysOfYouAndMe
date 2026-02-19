using UnityEngine;

public class Joystick_PlayerScript : MonoBehaviour
    {

    [Header("Movement")]
    public float moveSpeed = 15f;
    public string AnimatorMoveFloatName = "Move";
    public float AnimatorSmoothBlendTree = 0.005f;
    private float moveInput;

    [Header("Jumping")]
    public float jumpForce = 25f;
    public LayerMask groundLayer;
    public string AnimatorJumpingTriggerName = "isJumping";
    private bool isGrounded;
    private bool isJumping = false;
    private float groundDistance = 3f;
    
    private SpriteRenderer spriteRenderer;
    private Animator anim;
    private Rigidbody2D rb;
    

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
            moveInput = TouchController.Vertical;

        // Check for jump input
        if (isJumping == true && isGrounded)
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
        isJumping = false;
        anim.SetTrigger(AnimatorJumpingTriggerName);
    }

    public void isJumpingg()
    {
        isJumping = true;
    }

    private void OnDrawGizmos()
    {   
        // Draw Ground checking line
        Gizmos.color = Color.yellow;
        Gizmos.DrawRay(transform.position, Vector2.down * groundDistance);
    }
}


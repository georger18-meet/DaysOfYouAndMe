using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TopDown_2DPlayer : MonoBehaviour
{
    [Header("Movement")]
    public float moveSpeed = 150f;
    public string AnimatorMoveFloatName = "Move";
    public float AnimatorSmoothBlendTree = 0.005f;
    private float moveHorizontal;
    private float moveVertical;

    [Header("Keybinds")]
    //public KeyCode runKey = KeyCode.LeftShift;    
    public KeyCode attackKey = KeyCode.Mouse1;

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
        rb.collisionDetectionMode = CollisionDetectionMode2D.Continuous;
        rb.constraints = RigidbodyConstraints2D.FreezeRotation;
        rb.gravityScale = 0.0f;
    }

    private void Update()
    {
        // Get input from horizontal & vertical axis
        moveHorizontal = Input.GetAxisRaw("Horizontal");
        moveVertical = Input.GetAxisRaw("Vertical");

        // Flip the sprite based on the horizontal movement direction
        if (moveHorizontal != 0)
        {
            spriteRenderer.flipX = moveHorizontal < 0;
        }

        // attacking example - can be any kind of animation...
        AttackingAnimation();
    }

    void FixedUpdate()
    {
        // Move the player based on input
        Vector2 movement = new Vector2(moveHorizontal, moveVertical).normalized * moveSpeed * Time.deltaTime;
        rb.linearVelocity = movement;

        // Change walking & running animations according to movement speed
        anim.SetFloat(AnimatorMoveFloatName, movement.magnitude, AnimatorSmoothBlendTree, Time.deltaTime);

        //Adjust player's sprite direction according to mouse position on screen
        Vector3 mousePos = Input.mousePosition;
        Vector3 playerScreenPoint = Camera.main.WorldToScreenPoint(transform.position);
        if (mousePos.x < playerScreenPoint.x)
        {
            spriteRenderer.flipX = true;
        }
        else
        {
            spriteRenderer.flipX = false;
        }
    }

    private void AttackingAnimation()
    {
        if (Input.GetKeyDown(attackKey))
        {
            anim.SetTrigger(AnimatorAttackingTriggerName);
        }
    }
}

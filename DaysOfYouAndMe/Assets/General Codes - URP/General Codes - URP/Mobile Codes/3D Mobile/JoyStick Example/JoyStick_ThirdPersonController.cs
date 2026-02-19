using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JoyStick_ThirdPersonController : MonoBehaviour
{
    [Header("Movement")]
    public float walkSpeed = 100f;    
    public float rotationSpeed = 5f;
    public string AnimatorMoveFloatName = "Move";
    public float AnimatorSmoothBlendTree = 0.1f;
    private float cachedMoveSpeed;
    private bool isMoving = true;
    //private bool isRotating = true;
    private bool isAttacking = false;

    [Header("Jumping")]
    public float jumpForce = 100f;
    public string AnimatorJumpingTriggerName = "isJumping";
    private bool isJumping = false;

    [Header("Attacking Example")]
    public string AnimatorAttackingTriggerName = "isAttacking";    

    [Header("Ground Check")]
    public float raycastDistance = 1.5f;
    public LayerMask whatIsGround;
    //private bool grounded;    

    private Vector3 moveDirection;
    //private Vector3 rotDirection;
    private Rigidbody rb;
    private Animator anim;

    private void Start()
    {
        rb = this.GetComponent<Rigidbody>();
        anim = this.GetComponent<Animator>();
        cachedMoveSpeed = walkSpeed;
        rb.freezeRotation = true;
    }

    public void Jump()
    {
        isJumping = true;
    }

    public void Attack()
    {
        isAttacking = true;
    }

    public void StopAttack()
    {
        isAttacking = false;
    }

    private void Update()
    {
        // ground check
        RaycastHit hit;
        if (Physics.Raycast(transform.position, Vector3.down, out hit, raycastDistance, whatIsGround))
        {
            //grounded = true;
        }
        else
        {
            //grounded = false;
        }       

        // attacking example - can be any kind of animation...
        AttackingAnimation();
    }

    private void FixedUpdate()
    {
        MovePlayer();

        if (isJumping == true)
        {
            // jump force & trigger jump animation
            rb.AddForce(new Vector3(0, jumpForce, 0));
            anim.SetTrigger(AnimatorJumpingTriggerName);
            isJumping = false;            
        }
    }

    private void MovePlayer()
    {
        float horizontalInput = TouchController.Horizontal;
        float verticalInput = TouchController.Vertical;

        // calculate movement - only move left & right (you can add move up & down too if you want)
        moveDirection = this.transform.forward * -verticalInput; //+ this.transform.right * -horizontalInput;
        if (moveDirection != Vector3.zero && isMoving == true)
        {
            rb.linearVelocity = moveDirection.normalized * cachedMoveSpeed * Time.deltaTime;            
        }        


        // calculate rotation:
        //rotDirection = this.transform.right * horizontalInput;
        //if (rotDirection != Vector3.zero && isRotating == true)
        //{
        //    this.transform.forward = Vector3.Slerp(this.transform.forward, rotDirection.normalized, rotationSpeed * Time.deltaTime);
        //}             


        // change walking & running animations according to movement speed
        anim.SetFloat(AnimatorMoveFloatName, rb.linearVelocity.magnitude, AnimatorSmoothBlendTree, 0.5f * Time.deltaTime);
    }

    public void StopMoving()
    {
        isMoving = false;
    }
    public void StopRotating()
    {
        //isRotating = false;
    }
    public void ReturnMoving()
    {
        isMoving = true;
    }
    public void ReturnRotating()
    {
        //isRotating = true;
    }

    private void AttackingAnimation()
    {
        if (isAttacking == true)
        {
            anim.SetTrigger(AnimatorAttackingTriggerName);
            var currentWeight = anim.GetLayerWeight(1);
            currentWeight = Mathf.Lerp(currentWeight, 1.0f, Time.deltaTime);
            anim.SetLayerWeight(1, currentWeight);
        }
        if (isAttacking == false)
        {
            var currentWeight = anim.GetLayerWeight(1);
            currentWeight = Mathf.Lerp(currentWeight, 0.0f, Time.deltaTime);
            anim.SetLayerWeight(1, currentWeight);
        }              
    }
}
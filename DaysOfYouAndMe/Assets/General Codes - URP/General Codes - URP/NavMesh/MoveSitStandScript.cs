using System.Collections;
using UnityEngine;
using UnityEngine.AI;

[RequireComponent(typeof(Animator))]

public class MoveSitStandScript : MonoBehaviour
{
    public Transform chair; // The chair the character should sit on
    public float sittingAndStandingDuration = 6.0f; // Combined duration for sitting and standing
    public float seatingPositionMultiplier = 1.2f; // Multiplier for adjusting seating position
    public float turnSpeed = 2.0f; // Speed for smooth rotation

    private NavMeshAgent navMeshAgent;
    private bool isMoving = false; // Initialize to false
    private bool isSitting = false; // To prevent repeated sitting

    private Animator animator;
    private float originalStoppingDistance; // Store the original stopping distance

    private Quaternion sitRotation; // The rotation to sit on the chair

    private void Start()
    {
        navMeshAgent = GetComponent<NavMeshAgent>();
        animator = GetComponent<Animator>();
        originalStoppingDistance = navMeshAgent.stoppingDistance;

        // Calculate the rotation to face the chair
        Vector3 sitDirection = chair.forward;
        sitRotation = Quaternion.LookRotation(sitDirection, Vector3.up);
    }

    public void MoveToChair()
    {
        if (!isSitting && !isMoving)
        {
            // Calculate the destination position slightly in front of the chair
            Vector3 chairPosition = chair.position;
            Vector3 sitDirection = chair.forward;
            Vector3 destinationPosition = chairPosition + sitDirection * seatingPositionMultiplier;

            // Start moving to the calculated destination
            navMeshAgent.SetDestination(destinationPosition);

            // Set stopping distance to 0 before moving
            navMeshAgent.stoppingDistance = 0;
            isMoving = true; // Mark as moving
        }
    }

    private void Update()
    {
        // Check if the NavMesh Agent has reached the destination
        if (isMoving && !navMeshAgent.pathPending && navMeshAgent.remainingDistance <= navMeshAgent.stoppingDistance)
        {
            // Stop the NavMesh Agent from moving temporarily
            navMeshAgent.isStopped = true;
            isMoving = false;

            // Start a coroutine to handle sitting
            StartCoroutine(Sit());
        }
    }

    private IEnumerator Sit()
    {
        isSitting = true; // Mark as sitting to prevent repeated sitting

        // Smoothly turn the character towards the chair
        Quaternion startRotation = transform.rotation;
        float elapsedTime = 0f;
        float rotationDuration = 1.0f / turnSpeed;

        while (elapsedTime < rotationDuration)
        {
            transform.rotation = Quaternion.Slerp(startRotation, sitRotation, elapsedTime / rotationDuration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // Set the final rotation to ensure accuracy
        transform.rotation = sitRotation;

        // Set stopping distance to 0 during sitting
        navMeshAgent.stoppingDistance = 0;

        // Play animation to sit down
        animator.SetBool("IsSitting", true);

        // Wait for the character to sit
        yield return new WaitForSeconds(sittingAndStandingDuration / 2);

        // Reset animation states
        animator.SetBool("IsSitting", false);
        animator.SetBool("IsStandingUp", true);

        // Wait for the character to stand up
        yield return new WaitForSeconds(sittingAndStandingDuration / 2);

        // Reset animation state
        animator.SetBool("IsStandingUp", false);

        // Reset stopping distance to the original value
        navMeshAgent.stoppingDistance = originalStoppingDistance;

        // Resume moving and calculate the destination position slightly in front of the chair
        isSitting = false; // Reset the flag
        Vector3 chairPosition = chair.position;
        Vector3 sitDirection = chair.forward;
        Vector3 destinationPosition = chairPosition + sitDirection * seatingPositionMultiplier;

        // Calculate the new rotation to face the destination
        sitRotation = Quaternion.LookRotation(sitDirection, Vector3.up);

        // Move the character back to the calculated destination
        navMeshAgent.isStopped = false;
        navMeshAgent.SetDestination(destinationPosition);
    }
}

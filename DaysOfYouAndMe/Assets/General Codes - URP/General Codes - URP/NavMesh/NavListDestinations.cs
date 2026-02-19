using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

[RequireComponent(typeof(Animator), typeof(NavMeshAgent))]
public class NavListDestinations : MonoBehaviour
{
    [Header("Animation Settings")]
    public string AnimatorFloatParameter = "Move";
    public float smoothBlendTree = 0.1f;

    [Header("Navigation Settings")]
    public Transform[] waypoints;
    public float[] delaytime;

    [Header("Rotation Settings")]
    [Range(100f, 360f)]
    public float rotationSpeed = 180f;
    public bool shouldRotateTowardsDestination = true;

    [Header("Debug")]
    public bool enableDebugLogs = false;

    private NavMeshAgent agent;
    private Animator anim;
    private int indexer;
    private float passedtime;
    private bool Moving = true;

    private void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
        anim = GetComponent<Animator>();
        ValidateWaypointsAndDelays();
    }

    void Update()
    {
        if (Moving && waypoints.Length > 0)
        {
            agent.SetDestination(waypoints[indexer].transform.position);

            // Rotation towards destination
            if (shouldRotateTowardsDestination)
            {
                RotateTowardsDestination();
            }
        }

        // Waypoint progression logic
        if (Vector3.Distance(transform.position, waypoints[indexer].position) <= agent.stoppingDistance)
        {
            passedtime += Time.deltaTime;

            if (passedtime > delaytime[indexer])
            {
                AdvanceToNextWaypoint();
            }
        }

        // Animation velocity blend
        anim.SetFloat(AnimatorFloatParameter, agent.velocity.magnitude, smoothBlendTree, 0.5f * Time.deltaTime);
    }

    private void RotateTowardsDestination()
    {
        if (agent.velocity.magnitude > 0.1f)
        {
            Vector3 direction = agent.desiredVelocity.normalized;

            if (direction != Vector3.zero)
            {
                // Create target rotation looking at movement direction
                Quaternion targetRotation = Quaternion.LookRotation(direction);

                // Smoothly rotate towards target rotation
                transform.rotation = Quaternion.Slerp(
                    transform.rotation,
                    targetRotation,
                    rotationSpeed * Time.deltaTime
                );
            }
        }
    }

    private void AdvanceToNextWaypoint()
    {
        indexer++;
        passedtime = 0;

        // Reset to first waypoint when reaching end
        if (indexer >= waypoints.Length)
        {
            indexer = 0;
        }

        if (enableDebugLogs)
        {
            Debug.Log($"Advanced to waypoint {indexer}");
        }
    }

    private void ValidateWaypointsAndDelays()
    {
        // Ensure delay times match waypoints
        if (waypoints.Length != delaytime.Length)
        {
            Debug.LogWarning("Waypoints and delay times do not match. Adjusting delay times.");

            // Resize delay times array to match waypoints
            System.Array.Resize(ref delaytime, waypoints.Length);
        }
    }

    public void StopMove()
    {
        anim.SetFloat(AnimatorFloatParameter, 0.2f, smoothBlendTree, Time.deltaTime);
        agent.SetDestination(transform.position);
        Moving = false;

        if (enableDebugLogs)
        {
            Debug.Log("Movement Stopped");
        }
    }

    public void ReturnMove()
    {
        agent.SetDestination(waypoints[indexer].position);
        Moving = true;

        if (enableDebugLogs)
        {
            Debug.Log("Movement Resumed");
        }
    }

    // Optional: Visualization in Scene View
    private void OnDrawGizmosSelected()
    {
        if (waypoints == null || waypoints.Length == 0) return;

        Gizmos.color = Color.yellow;
        for (int i = 0; i < waypoints.Length; i++)
        {
            if (waypoints[i] != null)
            {
                Gizmos.DrawWireSphere(waypoints[i].position, 0.5f);

                // Draw lines between waypoints
                if (i < waypoints.Length - 1)
                {
                    Gizmos.DrawLine(waypoints[i].position, waypoints[i + 1].position);
                }
            }
        }
    }
}

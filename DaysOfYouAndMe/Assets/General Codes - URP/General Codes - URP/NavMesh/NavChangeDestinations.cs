using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

[RequireComponent(typeof(Animator), typeof(NavMeshAgent))]
public class NavChangeDestinations : MonoBehaviour
{
    [Header("Agent References")]
    private GameObject player;
    private NavMeshAgent agent;
    private Animator anim;

    [Header("Animation Settings")]
    public string AnimatorFloatParameter = "Move";
    public float smoothBlendTree = 0.1f;

    [Header("Movement Configuration")]
    public Transform[] waypoints;
    private int indexer = 0;
    public string FollowTag = "Player";
    public bool followPlayerAtStart = false;

    [Header("Rotation Settings")]
    [Range(1f, 10f)]
    public float rotationSpeed = 5f;
    public bool shouldRotateTowardsDestination = true;

    private void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
        anim = GetComponent<Animator>();
    }

    void Start()
    {
        player = GameObject.FindWithTag(FollowTag);
        indexer = 0;
    }

    private void Update()
    {
        // Destination Selection
        if (followPlayerAtStart)
        {
            agent.SetDestination(player.transform.position);
        }
        else
        {
            agent.destination = waypoints[indexer].position;
        }

        // Animation Velocity Blend
        anim.SetFloat(AnimatorFloatParameter, agent.velocity.magnitude, smoothBlendTree, 0.5f * Time.deltaTime);

        // Rotation Towards Destination
        if (shouldRotateTowardsDestination)
        {
            RotateTowardsDestination();
        }
    }

    private void RotateTowardsDestination()
    {
        // If agent is moving
        if (agent.velocity.magnitude > 0.1f)
        {
            Vector3 direction = agent.desiredVelocity.normalized;

            if (direction != Vector3.zero)
            {
                Quaternion lookRotation = Quaternion.LookRotation(direction);
                transform.rotation = Quaternion.Slerp(
                    transform.rotation,
                    lookRotation,
                    Time.deltaTime * rotationSpeed
                );
            }
        }
    }

    // Existing Destination Methods
    public void SetNewDestinationRandom()
    {
        followPlayerAtStart = false;
        indexer = Random.Range(0, waypoints.Length);
    }

    public void SetNewDestination0() => SetDestinationIndex(0);
    public void SetNewDestination1() => SetDestinationIndex(1);
    public void SetNewDestination2() => SetDestinationIndex(2);
    public void SetNewDestination3() => SetDestinationIndex(3);
    public void SetNewDestination4() => SetDestinationIndex(4);

    private void SetDestinationIndex(int index)
    {
        followPlayerAtStart = false;
        indexer = Mathf.Clamp(index, 0, waypoints.Length - 1);
    }

    public void SetPlayerDestination()
    {
        followPlayerAtStart = true;
    }

    public void StopMove()
    {
        anim.SetFloat(AnimatorFloatParameter, 0.2f, smoothBlendTree, Time.deltaTime);
        agent.SetDestination(transform.position);
    }
}

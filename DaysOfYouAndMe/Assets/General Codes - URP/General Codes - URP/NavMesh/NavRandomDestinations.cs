using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

// in this script, the NavAgent will randomly choose a Waypoint from the list of WPs you create in the Inspector,
// plus, will randomly wait a certain amount of seconds in each WP.

[RequireComponent(typeof(Animator))]

public class NavRandomDestinations : MonoBehaviour
{
    public string AnimatorFloatParameter = "Move";
    public float smoothBlendTree = 0.1f;
    private NavMeshAgent agent;
    public Transform[] waypoints;
    int indexer;
    public float[] delaytime;
    private float passedtime;    
    private Animator anim;

    void Start()
    {       
        agent = this.GetComponent<NavMeshAgent>();
        agent.destination = waypoints[0].position;
        anim = this.GetComponent<Animator>();
    }
  
    void Update()
    {
        if (Vector3.Distance(this.transform.position, waypoints[indexer].position) <= agent.stoppingDistance)
        {
            passedtime += Time.deltaTime;

            if (passedtime > delaytime[indexer])
            {
                indexer = Random.Range(0, waypoints.Length);
                indexer = Random.Range(0, delaytime.Length);
                agent.SetDestination(waypoints[indexer].position);
                passedtime = 0;                
            }         
        }

        anim.SetFloat(AnimatorFloatParameter, agent.velocity.magnitude, smoothBlendTree, 0.5f * Time.deltaTime);
    }

    public void StopMove()
    {
        anim.SetFloat(AnimatorFloatParameter, 0.2f, smoothBlendTree, Time.deltaTime);
        agent.SetDestination(this.transform.position);
    }

    public void ReturnMove()
    {
        indexer = Random.Range(0, waypoints.Length);
        agent.SetDestination(waypoints[indexer].position);
    }
}


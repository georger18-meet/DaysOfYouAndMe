using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

// use this script to have a NavAgent follow the player (or something else, if you wished) at Start.
// you can then have the agent return to its original place or stop moving, via a public unity event.

[RequireComponent(typeof(Animator))]

public class NavAttackPlayer : MonoBehaviour
{
    public string AnimatorFloatParameter = "Move";
    public float smoothBlendTree = 0.1f;
    private GameObject player;
    private NavMeshAgent agent;
    private Animator anim;
    public GameObject navagentOriginalPosition;
    public bool followPlayerAtStart = true;
    public string FollowTag = "Player";
    public float turnToPlayerSpeed = 2.5f;
    public string AnimatorBoolAttack = "Attack";
    
    void Start()
    {
        player = GameObject.FindWithTag(FollowTag);
        agent = this.GetComponent<NavMeshAgent>();
        anim = this.GetComponent<Animator>();
    }  
    
      private void Update()
      {
        if (followPlayerAtStart == true)
        {
        agent.SetDestination(player.transform.position);
        }

        if (Vector3.Distance(this.transform.position, player.transform.position) <= agent.stoppingDistance)
        {
            anim.SetBool(AnimatorBoolAttack, true);
            //var currentWeight = anim.GetLayerWeight(1);
            //currentWeight = Mathf.Lerp(currentWeight, 1.0f, Time.deltaTime);
            //anim.SetLayerWeight(1, currentWeight);
            //anim.SetLayerWeight(1, 1f);
        }
        else
        {
            anim.SetBool(AnimatorBoolAttack, false);
            //var currentWeight = anim.GetLayerWeight(1);
            //currentWeight = Mathf.Lerp(currentWeight, 0.0f, Time.deltaTime);
            //anim.SetLayerWeight(1, currentWeight);            
            //anim.SetLayerWeight(1, 0f);
        }


        anim.SetFloat(AnimatorFloatParameter, agent.velocity.magnitude, smoothBlendTree, 0.5f * Time.deltaTime);
    }
   
      public void ReturnToOriginalPosition()
      {
        followPlayerAtStart = false;
        agent.SetDestination(navagentOriginalPosition.transform.position);
      }

      public void FollowPlayer()
      {
        followPlayerAtStart = true;
      }

    public void StopMove()
    {
       anim.SetFloat(AnimatorFloatParameter, 0.2f, smoothBlendTree, Time.deltaTime);
       agent.SetDestination(this.transform.position);
       followPlayerAtStart = false;
    }

    private void FixedUpdate()
    {
        Vector3 targetDirection = player.transform.position - transform.position;
        float singleStep = turnToPlayerSpeed * Time.deltaTime;
        Vector3 newDirection = Vector3.RotateTowards(transform.forward, targetDirection, singleStep, 0.0f);
        transform.rotation = Quaternion.LookRotation(newDirection);
    }
}


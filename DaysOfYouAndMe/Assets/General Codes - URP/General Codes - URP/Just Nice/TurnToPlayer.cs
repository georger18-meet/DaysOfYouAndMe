using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// use this script to have gameobjects turn towards a "player" - as triggered by a public unity event.
// could be useful!

public class TurnToPlayer : MonoBehaviour
{

    [Header("Turning settings")]
    private Transform target;
    public Transform OriginPos;
    public Transform PlayerTarget;
    private float speed;
    public float ToOriginalPositionSpeed;
    public float ToPlayerPositionSpeed;

    private void Start()
    {
        target = this.gameObject.transform;
        target = OriginPos;
    }

    private void FixedUpdate()
    {
       
       Vector3 targetDirection = target.position - transform.position;
       float singleStep = speed * Time.deltaTime;
       Vector3 newDirection = Vector3.RotateTowards(transform.forward, targetDirection, singleStep, 0.0f);
       transform.rotation = Quaternion.LookRotation(newDirection);
    }

    public void OriginalPosition()
    {
        target = OriginPos;
        speed = ToOriginalPositionSpeed;
    }

    public void PlayerPosition()
    {
        target = PlayerTarget;
        speed = ToPlayerPositionSpeed;
    }

    
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class TouchMove : MonoBehaviour
{
    public float speed = 5;
    Rigidbody rigidBody;

    void Awake()
    {
        rigidBody = GetComponent<Rigidbody>();
    }

    void FixedUpdate()
    {
        float inputH = TouchController.Horizontal;
        float inputV = TouchController.Vertical;
        rigidBody.linearVelocity = new Vector3(inputH * speed, rigidBody.linearVelocity.y, inputV * speed);
    }
}
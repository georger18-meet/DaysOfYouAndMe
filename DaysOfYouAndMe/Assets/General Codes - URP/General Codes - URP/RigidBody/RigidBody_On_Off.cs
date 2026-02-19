using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RigidBody_On_Off : MonoBehaviour
{

    private Rigidbody rb;
    
    void Start()
    {
        rb = this.GetComponent<Rigidbody>();
    }

    public void Rigidbody_On()
    {
        rb.useGravity = true;
    }

    public void Rigidbody_Off()
    {
        rb.useGravity = false;
    }

    
}

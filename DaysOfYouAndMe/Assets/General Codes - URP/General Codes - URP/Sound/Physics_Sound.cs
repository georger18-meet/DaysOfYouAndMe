using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Put this script on a gameobject with a spatialized (local) audiosource - to enhance realism.

public class Physics_Sound : MonoBehaviour
{
    private AudioSource audiosource;
    public int _magnitude = 3;
    
    void Awake()
    {
        audiosource = this.GetComponent<AudioSource>();
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.relativeVelocity.magnitude > _magnitude)
        {
            audiosource.Play();
        }
    }
}

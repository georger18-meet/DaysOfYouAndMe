using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class CollisionEvents : MonoBehaviour
{
    public UnityEvent CollisionEvent;
    public int magnitude = 3;
    public LayerMask collisionLayers = Physics.AllLayers;

    private void OnCollisionEnter(Collision collision)
    {
        // Check if the collision object's layer is in the specified layers
        if ((collisionLayers.value & (1 << collision.gameObject.layer)) != 0)
        {
            if (collision.relativeVelocity.magnitude > magnitude)
            {
                CollisionEvent.Invoke();
            }
        }
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class CollisionEvents2D : MonoBehaviour
{
    public UnityEvent ColiisionEvent;
    public int magnitude = 3;

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.relativeVelocity.magnitude > magnitude)
        {
            ColiisionEvent.Invoke();
        }
    }
}

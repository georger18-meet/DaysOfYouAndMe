using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class FallOffScreen_Event : MonoBehaviour
{
    public Transform player;
    public float lowerBoundOffset = 5f;

    public UnityEvent onPlayerFall; // Event to trigger when player falls

    void Update()
    {       
        if (player.position.y < transform.position.y - lowerBoundOffset)
        {
            // Trigger player fall event
            onPlayerFall?.Invoke();
        }
    }
}

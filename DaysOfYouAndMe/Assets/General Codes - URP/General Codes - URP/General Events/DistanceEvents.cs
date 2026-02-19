using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

// This script refers to Unity Events that trigger when a "player" is entering \ exiting a distance radius from the gameobject this script is attached to.
// You can change in the Inspector the amount of distance - as you wish.
// Remember to mark your "player" gameobject with the "Player" tag.

public class DistanceEvents : MonoBehaviour
{
    private GameObject player;
    public UnityEvent gotClose;
    public UnityEvent gotFar;
    private bool bchecker = true;
    public float distance = 5f;
    
    void Start()
    {
        player = GameObject.FindWithTag("Player");        
    }

    void Update()
    {
        if (Vector3.Distance(this.transform.position, player.transform.position) <= distance && bchecker == true)
        {
            gotClose.Invoke();
            bchecker = false;
            //return;              
        }

        if (Vector3.Distance(this.transform.position, player.transform.position) > distance && bchecker == false)
        {
            gotFar.Invoke();
            bchecker = true;
        }
    }
}

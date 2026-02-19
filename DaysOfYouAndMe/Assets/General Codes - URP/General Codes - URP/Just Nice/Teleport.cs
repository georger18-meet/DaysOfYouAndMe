using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Teleport : MonoBehaviour
{
    public GameObject whatToTeleport;
    public Transform whereToTeleport;
    public float delayTeleporting;
    public float delayAfterTeleportEvent;
    public UnityEvent StartTeleportEvent;
    public UnityEvent AfterTeleportedEvent;    
    
   public void Teleporting()
    {
        StartTeleportEvent.Invoke();
        StartCoroutine("BeginTeleporting");       
    }

    IEnumerator BeginTeleporting()
    {
        yield return new WaitForSeconds(delayTeleporting);
        whatToTeleport.transform.position = whereToTeleport.transform.position;
        StartCoroutine("BeginEvent");        
    }

    IEnumerator BeginEvent()
    {
        yield return new WaitForSeconds(delayAfterTeleportEvent);
        AfterTeleportedEvent.Invoke();
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

// This script refers to Unity Events that are triggered when the "player" enters \ exits a trigger area.
// Place this script on the gameobject with a collider, that has IsTrigger checked V.
// Remember to mark your "player" gameobject with the "Player" tag.

public class TriggerEvents : MonoBehaviour
{
    public string chooseTag = "Player";
    public bool triggerOneTime = false;
    private bool enteredArea = false;

    public UnityEvent TriggerEntered;
    public UnityEvent TriggerExited;

    private void OnTriggerEnter(Collider other)
    {
        if (triggerOneTime == true)
        {
            if (other.tag == chooseTag && enteredArea == false)
            {
                TriggerEntered.Invoke();
                enteredArea = true;
            }
        }

        else
        {
            if (other.tag == chooseTag)
            {
                TriggerEntered.Invoke();                
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (triggerOneTime == true)
        {
            if (other.tag == chooseTag && enteredArea == true)
            {
                TriggerExited.Invoke();
            }
        }

        else
        {
            if (other.tag == chooseTag)
            {
                TriggerExited.Invoke();
            }
        }
    }

}

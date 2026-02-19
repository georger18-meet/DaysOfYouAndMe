using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

// This script refers to Unity Events that are triggered when the "player" enters \ exits a trigger area.
// Place this script on the gameobject with a collider, that has IsTrigger checked V.
// Remember to mark your "player" gameobject with the "Player" tag.

public class TriggerEvents_withDelay : MonoBehaviour
{
    public string chooseTag = "Player";
    public bool triggerOneTime = false;
    private bool enteredArea = false;

    public UnityEvent TriggerEntered;
    public UnityEvent TriggerExited;

    public float triggerEnterEventTimeDelayed;
    public UnityEvent TriggerEnteredDelayed;

    public float triggerExitEventTimeDelayed;
    public UnityEvent TriggerExitedDelayed;

    private void OnTriggerEnter(Collider other)
    {
        if (triggerOneTime == true)
        {
            if (other.tag == chooseTag && enteredArea == false)
            {
                TriggerEntered.Invoke();
                enteredArea = true;
                StartCoroutine("TriggerEnteredDelayeddd");
            }
        }

        else
        {
            if (other.tag == chooseTag)
            {
                TriggerEntered.Invoke();
                StartCoroutine("TriggerEnteredDelayeddd");
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
                StartCoroutine("TriggerExitedDelayeddd");
            }
        }

        else
        {
            if (other.tag == chooseTag)
            {
                TriggerExited.Invoke();
                StartCoroutine("TriggerExitedDelayeddd");
            }
        }
    }

    IEnumerator TriggerEnteredDelayeddd()
    {
        yield return new WaitForSeconds(triggerEnterEventTimeDelayed);

        TriggerEnteredDelayed.Invoke();

    }

    IEnumerator TriggerExitedDelayeddd()
    {
        yield return new WaitForSeconds(triggerExitEventTimeDelayed);

        TriggerExitedDelayed.Invoke();

    }

}

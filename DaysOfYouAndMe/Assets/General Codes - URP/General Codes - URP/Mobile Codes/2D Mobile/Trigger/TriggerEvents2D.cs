using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class TriggerEvents2D : MonoBehaviour
{
    public string chooseTag = "Player";
    public bool triggerOneTime = false;
    private bool enteredArea = false;

    public UnityEvent TriggerEntered;
    public UnityEvent TriggerExited;

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (triggerOneTime == true)
        {
            if (other.CompareTag(chooseTag) && enteredArea == false)
            {
                TriggerEntered.Invoke();
                enteredArea = true;
            }
        }

        else
        {
            if (other.CompareTag(chooseTag))
            {
                TriggerEntered.Invoke();
            }
        }
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        if (triggerOneTime == true)
        {
            if (other.CompareTag(chooseTag) && enteredArea == true)
            {
                TriggerExited.Invoke();
            }
        }

        else
        {
            if (other.CompareTag(chooseTag))
            {
                TriggerExited.Invoke();
            }
        }
    }

}

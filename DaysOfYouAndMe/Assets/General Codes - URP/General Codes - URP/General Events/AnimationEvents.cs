using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

// use this formula to trigger events, inside an animation!
// you need to put this script on the gameobject that has an animation. This is called - "Animation Events".

public class AnimationEvents : MonoBehaviour
{

    public UnityEvent AE1;
    public UnityEvent AE2;
    public UnityEvent AE3;

   public void TriggerAE1()
    {
        AE1.Invoke();
    }

    public void TriggerAE2()
    {
        AE2.Invoke();
    }

    public void TriggerAE3()
    {
        AE3.Invoke();
    }
}

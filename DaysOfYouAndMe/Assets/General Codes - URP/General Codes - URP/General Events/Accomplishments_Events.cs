using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Accomplishments_Events : MonoBehaviour
{
    public int actionCount;
    public int maxActions = 2;    
    public UnityEvent AllActionsDone;
    public float secondEventTimeDelayed;
    public UnityEvent secondEvent_AllActionsDone;    

    public void ActionDone()
    {
        actionCount += 1;
    }

    private void Update()
    {
        if (actionCount == maxActions)
        {
            AllActionsDone.Invoke();            
            actionCount = 0;
            StartCoroutine("SecondEventDelay");
        }
    }

    IEnumerator SecondEventDelay()
    {
        yield return new WaitForSeconds(secondEventTimeDelayed);

        secondEvent_AllActionsDone.Invoke();

    }


}

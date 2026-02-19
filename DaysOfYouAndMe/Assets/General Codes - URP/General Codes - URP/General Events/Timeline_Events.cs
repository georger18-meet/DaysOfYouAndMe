using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

[System.Serializable]
public class DelayedEvent
{
    public UnityEvent delayedEvent;
    public float delayTime;
}

public class Timeline_Events : MonoBehaviour
{
    public bool startTimelineAtStart = true;
    public List<DelayedEvent> delayedEvents = new List<DelayedEvent>();
    
    void Start()
    {
        if (startTimelineAtStart)
            StartTimeline();
    }

    public void StartTimeline()
    {
        StartCoroutine(InvokeDelayedEvents());
    }

    IEnumerator InvokeDelayedEvents()
    {
        float startTime = Time.time;

        foreach (var delayedEvent in delayedEvents)
        {
            yield return new WaitForSeconds(delayedEvent.delayTime - (Time.time - startTime));
            delayedEvent.delayedEvent.Invoke();
        }
    }
}

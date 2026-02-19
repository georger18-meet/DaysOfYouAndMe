using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using TMPro;

[System.Serializable]
public class MoreEventsAfterTimeEnded
{
    public UnityEvent delayedEvent;
    public float delayTime;
}

public class Timer_Events : MonoBehaviour
{
    public float timeRemaining = 10;
    public bool startTimerOnAwake = false;
    public bool showTimerTextBeforeStart = false;
    public float specificTimeForEvent = 5f;
    public GameObject TimeText;
    public UnityEvent TimeEnded;
    public UnityEvent OnSpecificTimeReached;
    public List<MoreEventsAfterTimeEnded> moreEventsAfterTimeEnded = new List<MoreEventsAfterTimeEnded>();

    private bool hasTriggeredSpecificTime = false;

    void Awake()
    {
        if (TimeText != null)
        {
            TimeText.SetActive(showTimerTextBeforeStart);
            if (showTimerTextBeforeStart)
            {
                DisplayTime(timeRemaining);
            }
        }

        if (startTimerOnAwake)
        {
            StartTimer();
        }
    }

    public void StartTimer()
    {
        if (TimeText != null)
        {
            TimeText.SetActive(true);
        }
        startTimerOnAwake = true;
    }

    public void AddTime(float timeToAdd)
    {
        timeRemaining += timeToAdd;
        if (startTimerOnAwake)
        {
            DisplayTime(timeRemaining);
        }
    }

    public void DecreaseTime(float timeToRemove)
    {
        timeRemaining -= timeToRemove;
        if (timeRemaining <= 0)
        {
            timeRemaining = 0;
            if (startTimerOnAwake)
            {
                Debug.Log("Time has run out!");
                startTimerOnAwake = false;
                TimeEnded.Invoke();
                StartCoroutine(InvokeMoreEventsAfterTimeEnded());
            }
        }
        if (startTimerOnAwake || showTimerTextBeforeStart)
        {
            DisplayTime(timeRemaining);
        }
    }

    void Update()
    {
        if (startTimerOnAwake)
        {
            if (timeRemaining > 0)
            {
                timeRemaining -= Time.deltaTime;
                if (timeRemaining <= 0)
                {
                    timeRemaining = 0;
                }

                if (!hasTriggeredSpecificTime && timeRemaining <= specificTimeForEvent && timeRemaining > 0)
                {
                    OnSpecificTimeReached.Invoke();
                    hasTriggeredSpecificTime = true;
                }

                DisplayTime(timeRemaining);
            }

            if (timeRemaining == 0)
            {
                Debug.Log("Time has run out!");
                startTimerOnAwake = false;
                TimeEnded.Invoke();
                StartCoroutine(InvokeMoreEventsAfterTimeEnded());
                DisplayTime(timeRemaining); // Ensure final display shows 00:00
            }
        }
    }

    void DisplayTime(float timeToDisplay)
    {
        float minutes = Mathf.FloorToInt(timeToDisplay / 60);
        float seconds = Mathf.FloorToInt(timeToDisplay % 60);

        if (TimeText != null && TimeText.GetComponent<TextMeshProUGUI>() != null && TimeText.activeSelf)
        {
            TimeText.GetComponent<TextMeshProUGUI>().text = string.Format("{0:00}:{1:00}", minutes, seconds);
        }
    }

    IEnumerator InvokeMoreEventsAfterTimeEnded()
    {
        foreach (var moreEvent in moreEventsAfterTimeEnded)
        {
            yield return new WaitForSeconds(moreEvent.delayTime);
            moreEvent.delayedEvent.Invoke();
        }
    }
}
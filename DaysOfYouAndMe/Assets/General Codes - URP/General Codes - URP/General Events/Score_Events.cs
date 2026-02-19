using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using TMPro;

public class Score_Events : MonoBehaviour
{
    public GameObject scoreText;
    public int theScore;
    public int maxScore = 5;
    public int scoreIncrement = 1;
    public string scoreString = "Score: ";

    public UnityEvent AllCollected;
    public float secondEventTimeDelayed;
    public UnityEvent secondEvent_AllCollected;

    private bool allCollectedInvoked = false; // Flag to track if AllCollected event has been invoked

    private void Awake()
    {
        scoreText.GetComponent<TextMeshProUGUI>().text = scoreString + "0 / " + maxScore;
    }

    public void Collecting()
    {
        if (theScore < maxScore)
        {
            theScore += scoreIncrement;
            if (theScore > maxScore)
            {
                theScore = maxScore;
            }
            scoreText.GetComponent<TextMeshProUGUI>().text = scoreString + theScore + " / " + maxScore;
        }
    }

    private void Update()
    {
        if (theScore == maxScore && !allCollectedInvoked)
        {
            allCollectedInvoked = true; // Set the flag to true
            AllCollected.Invoke();
            //theScore = 0;
            StartCoroutine("SecondEventDelay");
        }
    }

    IEnumerator SecondEventDelay()
    {
        yield return new WaitForSeconds(secondEventTimeDelayed);
        secondEvent_AllCollected.Invoke();
    }

    // Method to reset the score to 0
    public void ResetScore()
    {
        theScore = 0;
        scoreText.GetComponent<TextMeshProUGUI>().text = scoreString + theScore + " / " + maxScore;
        allCollectedInvoked = false; // Reset the flag
    }
}

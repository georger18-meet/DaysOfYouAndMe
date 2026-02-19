using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.Events;

public class Highscore_Events : MonoBehaviour
{
    public GameObject scoreText;
    public GameObject bestScoreText;
    public string scoreString = "Score: ";
    public string bestScoreString = "Best Score: ";
    public int scoreIncrement = 1;
    public UnityEvent NewHighScoreReached;

    private int theScore;
    private string bestScoreKey = "BestScore";

    private void Awake()
    {
        theScore = 0;
        LoadBestScore();
        UpdateScoreText();
    }

    public void Collecting()
    {
        theScore += scoreIncrement;
        UpdateScoreText();

        if (theScore > GetBestScore())
        {
            SetBestScore(theScore);
            UpdateBestScoreText();
            NewHighScoreReached.Invoke();
        }
    }

    private void UpdateScoreText()
    {
        scoreText.GetComponent<TextMeshProUGUI>().text = scoreString + theScore;
    }

    private void UpdateBestScoreText()
    {
        bestScoreText.GetComponent<TextMeshProUGUI>().text = bestScoreString + GetBestScore();
    }

    private int GetBestScore()
    {
        if (PlayerPrefs.HasKey(bestScoreKey))
        {
            return PlayerPrefs.GetInt(bestScoreKey);
        }
        else
        {
            return 0;
        }
    }

    private void SetBestScore(int score)
    {
        PlayerPrefs.SetInt(bestScoreKey, score);
    }

    private void LoadBestScore()
    {
        bestScoreText.GetComponent<TextMeshProUGUI>().text = bestScoreString + GetBestScore();
    }

    private void Update()
    {
        if (theScore >= int.MaxValue) // Prevent overflow
        {
            theScore = 0;
        }

        if (theScore > GetBestScore())
        {
            SetBestScore(theScore);
            UpdateBestScoreText();
        }

        if (theScore == int.MaxValue) // Handle maximum score reached
        {
            theScore = 0;
        }
    }

    public void ResetBestScore()
    {
        PlayerPrefs.DeleteKey(bestScoreKey);
        UpdateBestScoreText();
    }
}

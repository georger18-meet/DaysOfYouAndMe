using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Load_Scene : MonoBehaviour
{
    public string sceneName;
    public float timeDelayed;

    public void ChangeScene()
    {
        StartCoroutine(DelayChangeScene());
    }

    IEnumerator DelayChangeScene()
    {
        float timer = 0f;
        while (timer < timeDelayed)
        {
            // Use unscaledDeltaTime to make the delay independent of time scale
            timer += Time.unscaledDeltaTime;
            yield return null;
        }

        SceneManager.LoadScene(sceneName);
    }
}

using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Async_Load_Scene : MonoBehaviour
{
    public string sceneName;
    public float timeDelayed;
    private bool sceneChanging = false;

    void Start()
    {
        StartCoroutine(LoadScene());
    }

    IEnumerator LoadScene()
    {
        yield return null;

        // Begin to load the Scene you specify
        AsyncOperation asyncOperation = SceneManager.LoadSceneAsync(sceneName);

        // Don't let the Scene activate until you allow it to
        asyncOperation.allowSceneActivation = false;

        while (!asyncOperation.isDone)
        {
            if (sceneChanging)
            {
                // Activate the Scene
                asyncOperation.allowSceneActivation = true;
            }

            yield return null;
        }
    }

    public void AsyncChangeScene()
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

        sceneChanging = true;
    }
}
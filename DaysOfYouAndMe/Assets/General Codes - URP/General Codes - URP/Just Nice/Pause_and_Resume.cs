using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pause_and_Resume : MonoBehaviour
{
    public bool pauseSounds = true; // Variable to control pausing of sounds
    public bool pauseTimeScale = true; // Variable to control pausing of time scale

    public List<AudioSource> audioSourcesToIgnore; // List of AudioSources to ignore during pause
    public List<Animator> animatorsToIgnore; // List of Animators to ignore during pause

    private float originalTimeScale; // Store the original time scale when pausing

    private void Start()
    {
        // Store the original time scale
        originalTimeScale = Time.timeScale;
    }

    public void Pause()
    {
        // Pause Time Scale and update animators if required
        if (pauseTimeScale)
        {
            Time.timeScale = 0f;
            Time.fixedDeltaTime = 0.02f * Time.timeScale;

            // Change animators to use Unscaled Time
            foreach (Animator animator in Object.FindObjectsByType<Animator>(FindObjectsSortMode.None))
            {
                if (animatorsToIgnore.Contains(animator))
                {
                    animator.updateMode = AnimatorUpdateMode.UnscaledTime;
                }
            }
        }

        // Pause all AudioSources if required
        if (pauseSounds)
        {
            foreach (AudioSource audioSource in Object.FindObjectsByType<AudioSource>(FindObjectsSortMode.None))
            {
                if (!audioSourcesToIgnore.Contains(audioSource))
                {
                    audioSource.Pause();
                }
            }
        }
    }

    public void Resume()
    {
        // Resume Time Scale and update animators if required
        if (pauseTimeScale)
        {
            Time.timeScale = originalTimeScale;
            Time.fixedDeltaTime = 0.02f * Time.timeScale;

            // Change animators back to Normal Time
            foreach (Animator animator in Object.FindObjectsByType<Animator>(FindObjectsSortMode.None))
            {
                if (animatorsToIgnore.Contains(animator))
                {
                    animator.updateMode = AnimatorUpdateMode.Normal;
                }
            }
        }

        // Resume all paused AudioSources if required
        if (pauseSounds)
        {
            foreach (AudioSource audioSource in Object.FindObjectsByType<AudioSource>(FindObjectsSortMode.None))
            {
                audioSource.UnPause();
            }
        }
    }
}
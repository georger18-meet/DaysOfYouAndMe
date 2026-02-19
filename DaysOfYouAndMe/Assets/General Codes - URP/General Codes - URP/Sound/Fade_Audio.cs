using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fade_Audio : MonoBehaviour
{
    public float fadeInSpeed = 0.1f;
    public float fadeOutSpeed = 0.1f;
    private AudioSource m_AudioSource;

    public float desiredVolumeFadeIn = 1f;
    public float desiredVolumeFadeOut = 0f;
    private float cachedDesiredVolumeFadeIn;
    private float cachedDesiredVolumeFadeOut;
    private float currentVolume;

    private bool isfadingin = false;
    private bool isfadingout = false;

    public bool fadeInAtStart = false;
    public bool playSoundWhenFadingIn = false;
    public bool stopSoundWhenFadingOut = false;

    private void Awake()
    {
        m_AudioSource = this.GetComponent<AudioSource>();
        if (m_AudioSource == null)
        {
            Debug.LogError("AudioSource component is missing on this GameObject.");
            return;
        }
    }

    void Start()
    {
        currentVolume = m_AudioSource.volume;
        cachedDesiredVolumeFadeIn = desiredVolumeFadeIn;
        cachedDesiredVolumeFadeOut = desiredVolumeFadeOut;

        if (fadeInAtStart)
        {
            FadeIn();
        }
    }

    void Update()
    {
        if (m_AudioSource == null) return;

        if (isfadingin)
        {
            currentVolume = Mathf.MoveTowards(currentVolume, cachedDesiredVolumeFadeIn, fadeInSpeed * Time.deltaTime);
            m_AudioSource.volume = currentVolume;

            if (playSoundWhenFadingIn && !m_AudioSource.isPlaying)
            {
                m_AudioSource.Play();
            }

            if (Mathf.Approximately(currentVolume, cachedDesiredVolumeFadeIn))
            {
                isfadingin = false;
            }
        }

        if (isfadingout)
        {
            currentVolume = Mathf.MoveTowards(currentVolume, cachedDesiredVolumeFadeOut, fadeOutSpeed * Time.deltaTime);
            m_AudioSource.volume = currentVolume;

            if (Mathf.Approximately(currentVolume, cachedDesiredVolumeFadeOut))
            {
                if (stopSoundWhenFadingOut)
                {
                    m_AudioSource.Stop();
                }
                isfadingout = false;
            }
        }
    }

    public void FadeIn()
    {
        if (m_AudioSource == null) return;
        isfadingin = true;
        isfadingout = false;
        if (playSoundWhenFadingIn && !m_AudioSource.isPlaying)
        {
            m_AudioSource.Play();
        }
    }

    public void FadeOut()
    {
        if (m_AudioSource == null) return;
        isfadingout = true;
        isfadingin = false;
    }
}

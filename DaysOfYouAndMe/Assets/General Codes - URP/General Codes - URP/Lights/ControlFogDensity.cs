using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ControlFogDensity : MonoBehaviour
{
    private bool isFog_FadeIn = false;
    private bool isFog_FadeOut = false;

    public float changeSpeed = 0.1f;
    public float desiredFogDensity_FadeIn = 0.15f;
    public float desiredFogDensity_FadeOut = 0f;
    private float cachedDesiredFog_FadeIn;
    private float cachedDesiredFog_FadeOut;
    private float currentDensity;

    private void Start()
    {
        currentDensity = RenderSettings.fogDensity;
        cachedDesiredFog_FadeIn = desiredFogDensity_FadeIn;
        cachedDesiredFog_FadeOut = desiredFogDensity_FadeOut;

    }

    private void Update()
    {
        if (isFog_FadeIn == true)
        {
            currentDensity = Mathf.MoveTowards(currentDensity, cachedDesiredFog_FadeIn, changeSpeed * Time.deltaTime);
            RenderSettings.fogDensity = currentDensity;
        }

        if (isFog_FadeOut == true)
        {
            currentDensity = Mathf.MoveTowards(currentDensity, cachedDesiredFog_FadeOut, changeSpeed * Time.deltaTime);
            RenderSettings.fogDensity = currentDensity;
        }
    }

    public void FadeOutFog()
    {
        isFog_FadeIn = false;
        isFog_FadeOut = true;
    }

    public void FadeInFog()
    {
        isFog_FadeIn = true;
        isFog_FadeOut = false;
    }
}

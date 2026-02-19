using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class Chromatic_Aberration_Intensity : MonoBehaviour
{
    public Volume pp;
    ChromaticAberration _ca;
    private bool isfadingin = false;
    private bool isfadingout = false;

    public float changeSpeed = 1f;

    public float desiredIntensityFadeIn = 1f;
    public float desiredIntensityFadeOut = 0f;
    private float cachedDesiredIntensityFadeIn;
    private float cachedDesiredIntensityFadeOut;
    private float currentIntensity;

    private void Start()
    {
        pp.profile.TryGet(out _ca);      

        currentIntensity = _ca.intensity.value;
        cachedDesiredIntensityFadeIn = desiredIntensityFadeIn;
        cachedDesiredIntensityFadeOut = desiredIntensityFadeOut;
    }

    private void Update()
    {
        if (isfadingin == true)
        {
            currentIntensity = Mathf.MoveTowards(currentIntensity, cachedDesiredIntensityFadeIn, changeSpeed * Time.deltaTime);
            _ca.intensity.value = currentIntensity;
        }

        if (isfadingout == true)
        {
            currentIntensity = Mathf.MoveTowards(currentIntensity, cachedDesiredIntensityFadeOut, changeSpeed * Time.deltaTime);
            _ca.intensity.value = currentIntensity;
        }
    }

    public void CA_FadeIn()
    {
        isfadingin = true;
        isfadingout = false;
    }

    public void CA_FadeOut()
    {
        isfadingout = true;
        isfadingin = false;
    }
}

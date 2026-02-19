using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

public class Fade_PP : MonoBehaviour
{
    Volume pp;

    private float currentWeight;
    public float desiredWeightFadeIn = 1f;
    public float desiredWeightFadeOut = 0f;
    private float cachedDesiredWeightFadeIn;
    private float cachedDesiredWeightFadeOut;

    public float fadeSpeed = 0.5f;

    private bool isfadingin = false;
    private bool isfadingout = false;

    void Awake()
    {
        pp = this.GetComponent<Volume>();
        currentWeight = pp.weight;
        cachedDesiredWeightFadeIn = desiredWeightFadeIn;
        cachedDesiredWeightFadeOut = desiredWeightFadeOut;
    }
    
    void Update()
    {
        if (isfadingin == true)
        {
            currentWeight = Mathf.MoveTowards(currentWeight, cachedDesiredWeightFadeIn, fadeSpeed * Time.deltaTime);
            pp.weight = currentWeight;
        }

        if (isfadingout == true)
        {
            currentWeight = Mathf.MoveTowards(currentWeight, cachedDesiredWeightFadeOut, fadeSpeed * Time.deltaTime);
            pp.weight = currentWeight;
        }
    }

    public void PP_Fade_IN()
    {
        isfadingin = true;
        isfadingout = false;
    }

    public void PP_Fade_OUT()
    {
        isfadingout = true;
        isfadingin = false;
    }
}

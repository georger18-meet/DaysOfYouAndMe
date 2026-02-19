using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fade_Material : MonoBehaviour
{
    public float fadeInSpeed = 0.5f;
    public float fadeOutSpeed = 0.5f;
    private Material m_material;
    public float desiredAlphaFadeIn = 255f;
    public float desiredAlphaFadeOut = 0f;
    private float currentAlpha;
    private float cachedDesiredAlphaFadeIn;
    private float cachedDesiredAlphaFadeOut;

    private bool isfadingin = false;
    private bool isfadingout = false;

    public bool fadeOutAtStart = false; // Default is false

    void Start()
    {
        m_material = this.GetComponent<Renderer>().material;
        cachedDesiredAlphaFadeIn = desiredAlphaFadeIn / 255f;
        cachedDesiredAlphaFadeOut = desiredAlphaFadeOut / 255f;
        currentAlpha = m_material.color.a;

        if (fadeOutAtStart)
        {
            FadeOut();
        }
    }

    void Update()
    {
        if (isfadingin)
        {
            Color oldColor = m_material.color;
            Color newColor = new Color(oldColor.r, oldColor.g, oldColor.b, currentAlpha);
            m_material.color = newColor;
            currentAlpha = Mathf.MoveTowards(currentAlpha, cachedDesiredAlphaFadeIn, fadeInSpeed * Time.deltaTime);
        }

        if (isfadingout)
        {
            Color oldColor = m_material.color;
            Color newColor = new Color(oldColor.r, oldColor.g, oldColor.b, currentAlpha);
            m_material.color = newColor;
            currentAlpha = Mathf.MoveTowards(currentAlpha, cachedDesiredAlphaFadeOut, fadeOutSpeed * Time.deltaTime);
        }
    }

    public void FadeIn()
    {
        isfadingin = true;
        isfadingout = false;
    }

    public void FadeOut()
    {
        isfadingin = false;
        isfadingout = true;
    }
}

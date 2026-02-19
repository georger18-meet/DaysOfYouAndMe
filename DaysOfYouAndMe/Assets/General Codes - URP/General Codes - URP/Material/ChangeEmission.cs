using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeEmission : MonoBehaviour
{
    private Renderer rend;
    private Material mat;

    public float fadeSpeed = 1.0f;

    private bool isFadingIn = false;
    private bool isFadingOut = false;
    private float emissionIntensity = 0f;
    private float targetIntensity = 0f;

    private Color originalEmissionColor;
    private float originalEmissionIntensity;

    private void Start()
    {
        rend = this.GetComponent<Renderer>();
        mat = rend.material;

        if (!mat.HasProperty("_EmissionColor"))
        {
            Debug.LogError("Material does not have an _EmissionColor property");
            enabled = false;
            return;
        }

        originalEmissionColor = mat.GetColor("_EmissionColor");
        originalEmissionIntensity = originalEmissionColor.maxColorComponent / Mathf.LinearToGammaSpace(1f);
        emissionIntensity = 0f; // Start with emission off
    }

    private void Update()
    {
        if (isFadingIn)
        {
            emissionIntensity = Mathf.MoveTowards(emissionIntensity, targetIntensity, fadeSpeed * Time.deltaTime);
            UpdateEmission(emissionIntensity);

            if (Mathf.Approximately(emissionIntensity, targetIntensity))
            {
                isFadingIn = false;
            }
        }

        if (isFadingOut)
        {
            emissionIntensity = Mathf.MoveTowards(emissionIntensity, 0f, fadeSpeed * Time.deltaTime);
            UpdateEmission(emissionIntensity);

            if (Mathf.Approximately(emissionIntensity, 0f))
            {
                isFadingOut = false;
            }
        }
    }

    private void UpdateEmission(float intensity)
    {
        Color finalColor = originalEmissionColor * Mathf.LinearToGammaSpace(intensity / originalEmissionIntensity);
        mat.SetColor("_EmissionColor", finalColor);

        if (intensity > 0f)
        {
            mat.EnableKeyword("_EMISSION");
        }
        else
        {
            mat.DisableKeyword("_EMISSION");
        }
    }

    public void FadeInEmission()
    {
        targetIntensity = originalEmissionIntensity; // Use cached original intensity
        isFadingIn = true;
        isFadingOut = false;
    }

    public void FadeOutEmission()
    {
        isFadingIn = false;
        isFadingOut = true;
    }
}

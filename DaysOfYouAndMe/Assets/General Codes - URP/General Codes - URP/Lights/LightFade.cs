using UnityEngine;

public class LightFade : MonoBehaviour
{
    public float fadeSpeed = 1.0f;
    public float maxValue = 1.0f;
    public float minValue = 0.0f;

    private Light targetLight;
    private float targetIntensity;
    private float currentIntensity;

    private void Awake()
    {
        targetLight = GetComponent<Light>();
        if (targetLight == null)
        {
            Debug.LogError("No Light component found on this GameObject!");
            enabled = false;
            return;
        }

        // Initialize target intensity to the current intensity of the light
        targetIntensity = targetLight.intensity;
        currentIntensity = targetIntensity;
    }

    private void Update()
    {
        // Smoothly adjust the light intensity towards the target intensity
        currentIntensity = Mathf.MoveTowards(currentIntensity, targetIntensity, fadeSpeed * Time.deltaTime);
        targetLight.intensity = currentIntensity;
    }

    public void FadeIn()
    {
        // Set target intensity to the maximum value
        targetIntensity = maxValue;
    }

    public void FadeOut()
    {
        // Set target intensity to the minimum value
        targetIntensity = minValue;
    }
}

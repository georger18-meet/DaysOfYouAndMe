using UnityEngine;

public class LightColorChanger : MonoBehaviour
{
    public Color targetColor; // Public variant for the color to change into
    public float changeSpeed = 1f; // Public variant for the speed of the change

    private Light lightSource;
    private Color initialColor;
    private bool isChangingColor = false;

    private void Start()
    {
        lightSource = GetComponent<Light>();
        initialColor = lightSource.color;
    }

    public void ChangeColor()
    {
        if (!isChangingColor)
        {
            StartCoroutine(ChangeColorCoroutine());
        }
    }

    private System.Collections.IEnumerator ChangeColorCoroutine()
    {
        isChangingColor = true;

        float t = 0f;
        Color startColor = lightSource.color;

        while (t < 1f)
        {
            t += Time.deltaTime * changeSpeed;
            lightSource.color = Color.Lerp(startColor, targetColor, t);
            yield return null;
        }

        isChangingColor = false;
    }
}

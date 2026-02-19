using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class HitScreen : MonoBehaviour
{
    public Color screenColor = Color.red; // Color of the hit screen
    public float fadeInDuration = 0.1f; // Duration of the fade-in effect in seconds
    public float fadeOutDuration = 0.1f; // Duration of the fade-out effect in seconds

    private Canvas canvas;
    private Image image;

    private bool isAnimating = false; // Flag to track if the hit effect is currently animating

    public void Hit()
    {
        // Return if already animating
        if (isAnimating)
            return;

        // Set isAnimating to true to prevent overlapping animations
        isAnimating = true;

        // Check if canvas already exists
        if (canvas != null)
        {
            Destroy(canvas.gameObject);
        }

        CreateCanvasAndImage();
        StartCoroutine(FadeInAndOut());
    }

    private void CreateCanvasAndImage()
    {
        // Create a new canvas
        GameObject canvasGO = new GameObject("HitCanvas");
        canvas = canvasGO.AddComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;

        // Create a new image as a child of the canvas
        GameObject imageGO = new GameObject("HitImage");
        image = imageGO.AddComponent<Image>();
        image.transform.SetParent(canvas.transform);

        // Stretch the image within the canvas to match the screen size
        RectTransform imageRect = image.GetComponent<RectTransform>();
        imageRect.anchorMin = Vector2.zero;
        imageRect.anchorMax = Vector2.one;
        imageRect.offsetMin = Vector2.zero;
        imageRect.offsetMax = Vector2.zero;

        // Set the initial image color to transparent
        image.color = new Color(screenColor.r, screenColor.g, screenColor.b, 0f);

        // Disable raycast targeting
        image.raycastTarget = false;
    }

    private IEnumerator FadeInAndOut()
    {
        float elapsedTime = 0.0f;
        Color startColor = new Color(screenColor.r, screenColor.g, screenColor.b, 0f);
        Color endColor = new Color(screenColor.r, screenColor.g, screenColor.b, 1f);

        // Fade in
        while (elapsedTime < fadeInDuration)
        {
            float normalizedTime = elapsedTime / fadeInDuration;
            image.color = Color.Lerp(startColor, endColor, normalizedTime);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        image.color = endColor; // Ensure fully faded in

        // Wait for a short duration
        yield return new WaitForSeconds(0.1f);

        // Fade out
        elapsedTime = 0.0f;
        startColor = endColor;
        endColor = new Color(screenColor.r, screenColor.g, screenColor.b, 0f);

        while (elapsedTime < fadeOutDuration)
        {
            float normalizedTime = elapsedTime / fadeOutDuration;
            image.color = Color.Lerp(startColor, endColor, normalizedTime);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        image.color = endColor; // Ensure fully faded out

        // Clean up
        Destroy(canvas.gameObject);
        isAnimating = false; // Reset animation state
    }
}

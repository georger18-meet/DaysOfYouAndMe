using UnityEngine;
using UnityEngine.UI;

#if UNITY_EDITOR
using UnityEditor;
#endif

public class ParentScalerMatchUI : MonoBehaviour
{
    public CanvasScaler referenceCanvasScaler;

    private float referenceAspectRatio;
    private Vector3 initialScale;

    private void OnEnable()
    {
        if (referenceCanvasScaler == null)
            referenceCanvasScaler = FindAnyObjectByType<CanvasScaler>();

        Vector2 referenceResolution = referenceCanvasScaler.referenceResolution;
        referenceAspectRatio = referenceResolution.x / referenceResolution.y;
        initialScale = transform.localScale;

        ScaleParent();

#if UNITY_EDITOR
        EditorApplication.update += EditorUpdate;
#endif
    }

    private void OnDisable()
    {
#if UNITY_EDITOR
        EditorApplication.update -= EditorUpdate;
#endif
    }

    private void Update()
    {
        if (Application.isPlaying)
        {
            ScaleParent();
        }
    }

#if UNITY_EDITOR
    private void EditorUpdate()
    {
        if (!Application.isPlaying)
        {
            ScaleParent();
        }
    }
#endif

    private void ScaleParent()
    {
        Vector2 currentScreenSize = GetScreenSize();
        Vector2 scaleFactor = CalculateScaleFactor(currentScreenSize);
        transform.localScale = new Vector3(
            initialScale.x * scaleFactor.x,
            initialScale.y * scaleFactor.y,
            initialScale.z
        );

        Debug.Log($"Current size: {currentScreenSize.x}x{currentScreenSize.y}, Scale factor: {scaleFactor}, New scale: {transform.localScale}");
    }

    private Vector2 GetScreenSize()
    {
#if UNITY_EDITOR
        if (!Application.isPlaying)
        {
            return Handles.GetMainGameViewSize();
        }
#endif
        return new Vector2(Screen.width, Screen.height);
    }

    private Vector2 CalculateScaleFactor(Vector2 currentScreenSize)
    {
        float currentAspectRatio = currentScreenSize.x / currentScreenSize.y;
        float aspectRatioChange = currentAspectRatio / referenceAspectRatio;

        // If aspect ratio is wider than reference, scale height; otherwise, scale width
        if (aspectRatioChange >= 1)
        {
            return new Vector2(1, 1 / aspectRatioChange);
        }
        else
        {
            return new Vector2(aspectRatioChange, 1);
        }
    }
}
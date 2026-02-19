using UnityEngine;
using UnityEngine.UI;

public class UIEmissionAnimator : MonoBehaviour
{
    public Image image;
    public float startEmission = 0.0f;
    public float endEmission = 5.0f;
    public float speed = 1.0f;

    Material imageMaterial;
    float currentEmission = 0.0f;
    float originalEmission = 0.0f;
    bool increasingEmission = true;
    bool animationPlaying = false;

    void Start()
    {
        if (image != null)
        {
            imageMaterial = image.material;
            if (imageMaterial == null)
            {
                imageMaterial = new Material(Shader.Find("UI/ImageEmissionShader"));
                image.material = imageMaterial;
            }
        }
        originalEmission = imageMaterial.GetFloat("_EmissionStrength");
    }

    public void StartEmissionAnimation()
    {
        animationPlaying = true;
        currentEmission = startEmission;
        increasingEmission = true;
    }

    public void StopEmissionAnimation()
    {
        animationPlaying = false;
    }

    public void ReturnToOriginalEmission()
    {
        currentEmission = imageMaterial.GetFloat("_EmissionStrength");
        increasingEmission = currentEmission < originalEmission;
        animationPlaying = true;
    }

    void Update()
    {
        if (!animationPlaying)
            return;

        AnimateEmission();
    }

    void AnimateEmission()
    {
        if (increasingEmission)
        {
            currentEmission += Time.deltaTime * speed;
            if (currentEmission >= endEmission)
            {
                currentEmission = endEmission;
                increasingEmission = false;
                StopEmissionAnimation();
            }
        }
        else
        {
            currentEmission -= Time.deltaTime * speed;
            if (currentEmission <= startEmission)
            {
                currentEmission = startEmission;
                increasingEmission = true;
                animationPlaying = false;
            }
        }

        imageMaterial.SetFloat("_EmissionStrength", currentEmission);
    }
}

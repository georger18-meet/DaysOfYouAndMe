using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dissolve_Controller : MonoBehaviour
{
    public bool isVisibleAtStart = true;
    
    public float fadeInSpeed = 1f;
    public float fadeOutSpeed = 1f;
    private Material _material;

    public float desiredValueDissolveIn = 0f;
    public float desiredValueDissolveOut = 1f;

    private float currentValue = 0f;
    private float cachedDesiredFadeIn;
    private float cachedDesiredFadeOut;

    private bool isfadingin = false;
    private bool isfadingout = false;

    private void Start()
    {
        _material = this.GetComponent<Renderer>().sharedMaterial;

        cachedDesiredFadeIn = desiredValueDissolveIn;
        cachedDesiredFadeOut = desiredValueDissolveOut;
    }

    void Update()
    {
        if (isfadingin == true)
        {
            _material.SetFloat("_DissolveAmount", currentValue);
            currentValue = Mathf.MoveTowards(currentValue, cachedDesiredFadeIn, fadeInSpeed * Time.deltaTime);
                      
        }

        if (isfadingout == true)
        {
            _material.SetFloat("_DissolveAmount", currentValue);
            currentValue = Mathf.MoveTowards(currentValue, cachedDesiredFadeOut, fadeOutSpeed * Time.deltaTime);
            
        }
    }

    public void DissolveIn()
    {
        isfadingin = true;
        isfadingout = false;
    }

    public void DissolveOut()
    {
        isfadingout = true;
        isfadingin = false;
    }

    void OnApplicationQuit()
    {
        if (isVisibleAtStart == true)
        {
            _material.SetFloat("_DissolveAmount", 0f);
        }
        if (isVisibleAtStart == false)
        {
            _material.SetFloat("_DissolveAmount", 1f);
        }
    }
}

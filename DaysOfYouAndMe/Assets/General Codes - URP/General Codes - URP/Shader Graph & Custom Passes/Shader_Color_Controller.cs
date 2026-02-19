using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shader_Color_Controller : MonoBehaviour
{
    private MaterialPropertyBlock propertyBlock;        

    public bool ChangeInPlayMode = true;

    public string BaseColorReference;
    //public string NewColorReference;

    public Color newColor;

    void Start()
    {                   
        
    }

    //for using Material Property Block in Edit Mode:
    private void OnValidate()
    {
        if (ChangeInPlayMode == false)
        {
            if (propertyBlock == null)
            {
                propertyBlock = new MaterialPropertyBlock();
            }

            Renderer renderer = GetComponent<Renderer>();
            propertyBlock.SetColor(BaseColorReference, newColor);
            renderer.SetPropertyBlock(propertyBlock);
        }
    }

    //for using Material Property Block in Play Mode:
    public void ChangeColor()
    {
        if (ChangeInPlayMode == true)
        {
            if (propertyBlock == null)
            {
                propertyBlock = new MaterialPropertyBlock();
            }

            Renderer renderer = GetComponent<Renderer>();
            propertyBlock.SetColor(BaseColorReference, newColor);
            renderer.SetPropertyBlock(propertyBlock);
        }
    }
}

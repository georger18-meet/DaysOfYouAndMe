using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.VFX;

public class VFX_Transition : MonoBehaviour
{
    private VisualEffect visualEffect;
    public string nameOfExposedParameter;
    public int startAmount;
    public int desiredAmount;    

    void Awake()
    {
        visualEffect = this.GetComponent<VisualEffect>();
        visualEffect.SetFloat(nameOfExposedParameter, startAmount);
    }

    public void VFX_Parameter_Change_ON()
    {
        visualEffect.SetFloat(nameOfExposedParameter, desiredAmount);
    }

    public void VFX_Parameter_Change_OFF()
    {
        visualEffect.SetFloat(nameOfExposedParameter, startAmount);
    }
}
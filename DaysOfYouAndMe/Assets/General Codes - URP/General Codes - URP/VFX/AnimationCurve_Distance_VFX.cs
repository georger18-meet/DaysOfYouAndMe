using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.VFX;

public class AnimationCurve_Distance_VFX : MonoBehaviour
{

    [SerializeField] AnimationCurve curve;

    public GameObject player;

    private VisualEffect visualEffect;
    public string nameOfExposedParameter;

    private float currentDistance;
    private float totalDistance;
    private float remainingDistance;

    public float distance = 2f;



    void Start()
    {

        totalDistance = curve.keys[curve.keys.Length - 1].time;
        currentDistance = Vector3.Distance(this.transform.position, player.transform.position);

        visualEffect = this.GetComponent<VisualEffect>();

    }


    void Update()
    {

        remainingDistance = Vector3.Distance(this.transform.position, player.transform.position);



        visualEffect.SetFloat(nameOfExposedParameter, Mathf.Abs(curve.Evaluate(totalDistance - (remainingDistance / currentDistance) / distance)));


    }

}

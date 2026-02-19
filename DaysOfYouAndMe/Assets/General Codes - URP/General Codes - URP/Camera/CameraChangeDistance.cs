using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// use this script to change the "Zoom" effect of the camera, via public unity events.
// could be useful, to emphasize moments or just to make things "breath".

public class CameraChangeDistance : MonoBehaviour {

	public float ZoomRegularDistance;
	public float ZoomInDistance;
	public float ZoomOutDistance;
	public float smooth = 0.1f;
	Vector3 dollyDir;
	private float distance;
	

	
	void Awake () 
	{
		dollyDir = transform.localPosition.normalized;
		distance = transform.localPosition.magnitude;
	}
	
	
	void Update () 
	{

	transform.localPosition = Vector3.Lerp (transform.localPosition, dollyDir * distance, smooth * Time.deltaTime);
    

	}

	public void ZoomIn()
	{
		distance = ZoomInDistance;
		
	}

	public void ZoomOut()
    {
		distance = ZoomOutDistance;
    }

	public void ZoomRegular()
    {
		distance = ZoomRegularDistance;
    }

	
}

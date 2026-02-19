using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Camera Zooms in & out, when you click the right mouse button, or when you release it.
// Make sure your camra has the "MainCamera" tag.

public class MouseZooming : MonoBehaviour
{
    private float OriginalFOV;
    public Transform ReturnPoint;    
    public bool zoomFromCenter = true;
    public float TargetFOV = 35f;
    public float ZoomSpeed = 1f;
    public KeyCode MouseButtonToZoomWith = KeyCode.Mouse1;

    private void Start()
    {
        OriginalFOV = Camera.main.fieldOfView;        
    }

    void Update()
    {
        if (zoomFromCenter == true)
        {
            if (Input.GetKey(MouseButtonToZoomWith))
            {
                Camera.main.fieldOfView = Mathf.Lerp(Camera.main.fieldOfView, TargetFOV, Time.deltaTime * ZoomSpeed);
            }

            else
            {
                Camera.main.fieldOfView = Mathf.Lerp(Camera.main.fieldOfView, OriginalFOV, Time.deltaTime * ZoomSpeed);
            }
        }

        if (zoomFromCenter == false)
        {
            var camera = Camera.main;
            var mouseposition = Input.mousePosition;
            var ray = camera.ScreenPointToRay(new Vector3(mouseposition.x, mouseposition.y, camera.nearClipPlane));
            RaycastHit point;
            Physics.Raycast(ray, out point, 1000);
            Vector3 ZoomDirection = ray.GetPoint(5);
            float step = ZoomSpeed * Time.deltaTime;

            if (Input.GetKey(MouseButtonToZoomWith))
            {
                transform.position = Vector3.MoveTowards(transform.position, ZoomDirection, step);
            }
            else
            {
                transform.position = Vector3.MoveTowards(transform.position, ReturnPoint.position, step);
            }                       
        }      
    }
}

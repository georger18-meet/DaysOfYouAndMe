using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class ThreeD_MobileRaycasting_DoubleTap : MonoBehaviour
{
    private float lastTapTime;
    public float doubleTapTimeThreshold = 0.2f; // Adjust as needed
    public UnityEvent touchEvent;

    private void Update()
    {
        if (EventSystem.current.IsPointerOverGameObject() || EventSystem.current.currentSelectedGameObject != null)
        {
            //return;
        }

        if (Input.GetMouseButtonDown(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began))
        {
            float timeSinceLastTap = Time.time - lastTapTime;

            if (timeSinceLastTap < doubleTapTimeThreshold)
            {
                CastClickRay();
            }
            else
            {
                lastTapTime = Time.time;
            }
        }
    }

    private void CastClickRay()
    {
        var camera = Camera.main;
        var mouseposition = Input.mousePosition;
        var ray = camera.ScreenPointToRay(new Vector3(mouseposition.x, mouseposition.y, camera.nearClipPlane));

        if (Physics.Raycast(ray, out var hit) && hit.collider.gameObject == this.gameObject)
        {
            touchEvent.Invoke();
        }
    }
}

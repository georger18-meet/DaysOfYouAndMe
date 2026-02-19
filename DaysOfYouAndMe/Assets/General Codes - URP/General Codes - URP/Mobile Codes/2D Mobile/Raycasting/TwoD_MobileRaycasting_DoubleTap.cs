using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class TwoD_MobileRaycasting_DoubleTap : MonoBehaviour
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
        RaycastHit2D hit = Physics2D.GetRayIntersection(Camera.main.ScreenPointToRay(Input.mousePosition));

        if (hit.collider != null && hit.collider.gameObject == this.gameObject)
        {
            touchEvent.Invoke();
        }
    }
}

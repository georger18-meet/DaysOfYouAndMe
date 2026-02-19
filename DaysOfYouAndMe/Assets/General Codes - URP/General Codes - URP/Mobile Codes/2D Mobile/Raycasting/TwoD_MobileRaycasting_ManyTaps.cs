using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class TwoD_MobileRaycasting_ManyTaps : MonoBehaviour
{
    public UnityEvent[] touchEvents;
    private int tapCount = 0;

    private void Update()
    {
        if (EventSystem.current.IsPointerOverGameObject() || EventSystem.current.currentSelectedGameObject != null)
        {
            return;
        }
        if (Input.GetMouseButtonDown(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began))
        {
            CastClickRay();
        }
    }

    private void CastClickRay()
    {
        RaycastHit2D hit = Physics2D.GetRayIntersection(Camera.main.ScreenPointToRay(Input.mousePosition));

        if (hit.collider != null && hit.collider.gameObject == this.gameObject)
        {
            if (tapCount < touchEvents.Length)
            {
                touchEvents[tapCount].Invoke();
                tapCount++;
            }
            else
            {
                enabled = false; // Disable the script after all events are invoked
            }
        }
    }
}

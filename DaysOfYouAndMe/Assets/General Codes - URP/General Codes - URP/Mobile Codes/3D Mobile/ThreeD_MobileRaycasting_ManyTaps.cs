using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class ThreeD_MobileRaycasting_ManyTaps : MonoBehaviour
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
        var camera = Camera.main;
        var mouseposition = Input.mousePosition;
        var ray = camera.ScreenPointToRay(new Vector3(mouseposition.x, mouseposition.y, camera.nearClipPlane));

        if (Physics.Raycast(ray, out var hit) && hit.collider.gameObject == this.gameObject)
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

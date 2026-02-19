using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class ThreeD_MobileRaycasting_LongTap : MonoBehaviour
{
    public float longTapDuration = 1.0f; // Adjust as needed

    private bool isTouching = false;
    private float touchStartTime;

    public UnityEvent TouchEvent;

    private void Update()
    {
        if (EventSystem.current.IsPointerOverGameObject() || EventSystem.current.currentSelectedGameObject != null)
        {
            return;
        }

        if (Input.GetMouseButtonDown(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began))
        {
            touchStartTime = Time.time;
            isTouching = true;
        }

        if (isTouching && Time.time - touchStartTime >= longTapDuration)
        {
            CastClickRay();
            isTouching = false; // Reset touch state after long tap
        }

        if (Input.GetMouseButtonUp(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Ended))
        {
            isTouching = false; // Reset touch state if touch is released
        }
    }

    private void CastClickRay()
    {
        var camera = Camera.main;
        var mouseposition = Input.mousePosition;
        var ray = camera.ScreenPointToRay(new Vector3(mouseposition.x, mouseposition.y, camera.nearClipPlane));

        if (Physics.Raycast(ray, out var hit) && hit.collider.gameObject == this.gameObject)
        {
            TouchEvent.Invoke();
        }
    }
}

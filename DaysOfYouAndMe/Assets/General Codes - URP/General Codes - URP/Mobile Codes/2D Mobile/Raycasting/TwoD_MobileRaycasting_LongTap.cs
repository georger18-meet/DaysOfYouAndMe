using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class TwoD_MobileRaycasting_LongTap : MonoBehaviour
{
    public float longTapDuration = 1.0f; // Adjust as needed

    private bool isTouching = false;
    private float touchStartTime;

    public UnityEvent TouchEvent;
    public UnityEvent ReleaseEvent;

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
            ReleaseEvent.Invoke(); // Invoke release event
        }
    }

    private void CastClickRay()
    {
        RaycastHit2D hit = Physics2D.GetRayIntersection(Camera.main.ScreenPointToRay(Input.mousePosition));

        if (hit.collider != null && hit.collider.gameObject == this.gameObject)
        {
            TouchEvent.Invoke();
        }
    }
}

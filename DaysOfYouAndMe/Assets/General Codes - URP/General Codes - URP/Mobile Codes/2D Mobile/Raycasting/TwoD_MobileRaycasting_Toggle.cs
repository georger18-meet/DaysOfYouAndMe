using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class TwoD_MobileRaycasting_Toggle : MonoBehaviour
{
    public UnityEvent touchEvent1;
    public UnityEvent touchEvent2;
    private bool wasClicked = false;

    private void Update()
    {
        // Check if pointer is over UI, if so, return
        if (EventSystem.current.IsPointerOverGameObject() || EventSystem.current.currentSelectedGameObject != null)
        {
            return;
        }

        // Check for touch or mouse click
        if (Input.GetMouseButtonDown(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began))
        {
            CastClickRay(); 
        }
    }

    private void CastClickRay()
    {
        RaycastHit2D hit = Physics2D.GetRayIntersection(Camera.main.ScreenPointToRay(Input.mousePosition));

        // Check if ray hits any collider
        if (hit.collider != null)
        {
            // Check if hit collider is attached to this GameObject
            if (hit.collider.gameObject == this.gameObject)
            {
                if (wasClicked)
                {
                    touchEvent2.Invoke(); // Invoke touchEvent2 if previously clicked
                }
                else
                {
                    touchEvent1.Invoke(); // Invoke touchEvent1 if not previously clicked
                }
                wasClicked = !wasClicked; // Toggle wasClicked state
            }
        }
    }
}

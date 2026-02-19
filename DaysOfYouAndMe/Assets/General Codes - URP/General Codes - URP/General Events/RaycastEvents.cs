using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class RaycastEvents : MonoBehaviour
{
    public int rayLength = 25;

    public KeyCode ClickKey = KeyCode.Mouse0;

    private bool isMouseEntered = false;
    private bool doOnce = false;

    public bool isCharacterFirstPerson = true;

    public UnityEvent HoverEnter;
    public UnityEvent HoverExit;
    public UnityEvent Clicking;

    private bool mouseenteredbool = false;
    private bool mouseexitedbool = false;
    private bool mouseclickedbool = false;

    private void Update()
    {
        if (EventSystem.current.IsPointerOverGameObject())
        {
            mouseenteredbool = false;
            mouseexitedbool = false;
            mouseclickedbool = false;
        }
        else
        {
            mouseenteredbool = true;
            mouseexitedbool = true;
            mouseclickedbool = true;
        }

        if (isCharacterFirstPerson == false)
        {
            Vector3 worldMousePosition = Camera.main.ScreenToWorldPoint(new Vector3(Input.mousePosition.x, Input.mousePosition.y, 100f));
            Vector3 direction = worldMousePosition - Camera.main.transform.position;

            RaycastHit hit;

            if (Physics.Raycast(Camera.main.transform.position, direction, out hit, rayLength) && hit.collider.gameObject == this.gameObject)
            {

                if (doOnce == false && mouseenteredbool == true)
                {
                    HoverEnter.Invoke();
                }

                isMouseEntered = true;
                doOnce = true;

                if (Input.GetKeyDown(ClickKey) && mouseclickedbool == true)
                {
                    Clicking.Invoke();
                    return;
                }
            }

            else
            {
                if (isMouseEntered == true && mouseexitedbool == true)
                {
                    HoverExit.Invoke();
                    doOnce = false;
                    isMouseEntered = false;
                }
            }
        }

        if (isCharacterFirstPerson == true)
        {
            Vector3 direction = Camera.main.transform.TransformDirection(Vector3.forward);

            RaycastHit hit;

            if (Physics.Raycast(Camera.main.transform.position, direction, out hit, rayLength) && hit.collider.gameObject == this.gameObject)
            {

                if (doOnce == false && mouseenteredbool == true)
                {
                    HoverEnter.Invoke();
                }

                isMouseEntered = true;
                doOnce = true;

                if (Input.GetKeyDown(ClickKey) && mouseclickedbool == true)
                {
                    Clicking.Invoke();
                    return;
                }

            }

            else
            {
                if (isMouseEntered == true && mouseexitedbool == true)
                {
                    HoverExit.Invoke();
                    doOnce = false;
                    isMouseEntered = false;
                }
            }
        }


    }

}

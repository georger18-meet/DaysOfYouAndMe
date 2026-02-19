using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class TouchController : MonoBehaviour
{
    public static float Horizontal = 0, Vertical = 0;    

    void Awake()
    {
        SetupButton(transform.Find("Up").gameObject, Vector2.left);
        SetupButton(transform.Find("Down").gameObject, Vector2.right);
        SetupButton(transform.Find("Left").gameObject, Vector2.down);
        SetupButton(transform.Find("Right").gameObject, Vector2.up);
    }

    void SetupButton(GameObject buttonObject, Vector2 position)
    {
        EventTrigger eventTrigger = buttonObject.AddComponent<EventTrigger>();

        var pointerDown = new EventTrigger.Entry();
        pointerDown.eventID = EventTriggerType.PointerDown;
        pointerDown.callback.AddListener((e) => UpdateAxisValue(position));
        eventTrigger.triggers.Add(pointerDown);

        var pointerUp = new EventTrigger.Entry();
        pointerUp.eventID = EventTriggerType.PointerUp;
        pointerUp.callback.AddListener((e) => UpdateAxisValue(position, reset: true));
        eventTrigger.triggers.Add(pointerUp);
    }

    void UpdateAxisValue(Vector2 position, bool reset = false)
    {
        if (position.x == 0)
            Vertical = reset ? 0 : position.y;
        else
            Horizontal = reset ? 0 : position.x;
    }
}
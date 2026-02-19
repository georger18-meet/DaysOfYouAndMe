using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class MouseClickingEvents : MonoBehaviour
{
    public UnityEvent LeftMouseButton_Down;
    public UnityEvent LeftMouseButton_Up;
    public UnityEvent RightMouseButton_Pressed;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButton(0))
        {
            LeftMouseButton_Down.Invoke();           
        }

        if (Input.GetMouseButtonUp(0))
        {
            LeftMouseButton_Up.Invoke();     
        }

        if (Input.GetMouseButtonDown(1))
        {
            RightMouseButton_Pressed.Invoke();
        }
    }
}

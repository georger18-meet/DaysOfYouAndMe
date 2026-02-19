using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;

public class RotateWithMouse : MonoBehaviour
{
    public Vector2 turn;
    public float sensitivity = 5f;    
    public float speed = 1;
    public KeyCode MouseButtonToRotateWith = KeyCode.Mouse0;
    
    void Update()
    {
        if (Input.GetKey(MouseButtonToRotateWith))
        {
            turn.x += Input.GetAxis("Mouse X") * sensitivity;
            turn.y += Input.GetAxis("Mouse Y") * sensitivity;
            transform.localRotation = Quaternion.Euler(-turn.y, turn.x, 0);
        }
    }
}

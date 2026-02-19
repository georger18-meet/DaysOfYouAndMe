using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

// This script refers to the triggering of Unity Events when a keyboard key is hit - and works everytime its hit.
// You can change the keyboard key to whichever you like in public.
// Remember you can also give this event an added layer of conditions if you place it not under Private Void Update, but under Private Void OnMouseEnter for example,
// or if a certain distance is met.

public class KeyboardEvents_OneTime : MonoBehaviour
{
    public UnityEvent KeyIsPressed1;
    public KeyCode keyCode = KeyCode.None;
      
    private void Update()
    {
        if (Input.GetKeyDown(keyCode))
        {
            KeyIsPressed1.Invoke();
         
        }
        
    }

}
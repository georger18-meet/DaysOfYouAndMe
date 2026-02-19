using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

// This script refers to the triggering of Unity Events when a keyboard key is hit. Reverse event can happen when user hits
// the button again.
// You can change the keyboard key to whichever you like in public.
// Remember you can also give this event an added layer of conditions if you place it not under Private Void Update, but under
// Private Void OnMouseEnter for example, or if a certain distance is met.

public class KeyboardEvents_SameButton : MonoBehaviour
{
    public UnityEvent KeyIsPressed1;
    public UnityEvent KeyIsPressed2;
    public KeyCode keyCode = KeyCode.None;
    public bool bchecker;

    private void Start()
    {
        bchecker = true;                
    }

    private void Update()
    {
        if (Input.GetKeyDown(keyCode) && bchecker == true)
        {
            KeyIsPressed1.Invoke();
            bchecker = false;
            return;
        }

        if (Input.GetKeyDown(keyCode) && bchecker == false)
        {
            KeyIsPressed2.Invoke();
            bchecker = true;
            return;
        }       

    }

}

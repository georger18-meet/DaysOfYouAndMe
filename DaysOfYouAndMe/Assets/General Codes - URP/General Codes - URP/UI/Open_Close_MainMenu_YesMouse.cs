using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

// use this script to toggle between a closed or open UI main menu - while in play mode.
// this script uses the ESC button on the keyboard, but you can change that to whatever keyboard key you wish.

public class Open_Close_MainMenu_YesMouse : MonoBehaviour
{

    public UnityEvent Menu_Opening;
    public UnityEvent Menu_Closing;
    public KeyCode KeyToOpenMenu = KeyCode.Escape;
    private bool keyWasPressed = true;  

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyToOpenMenu) && keyWasPressed == true)
        {
            Menu_Opening.Invoke();
            
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
            keyWasPressed = false;
            return;
        }    

    }

    public void CloseMenu()
    {
       // Cursor.lockState = CursorLockMode.Locked;
       // Cursor.visible = false;
        Menu_Closing.Invoke();
        keyWasPressed = true;
    }
}


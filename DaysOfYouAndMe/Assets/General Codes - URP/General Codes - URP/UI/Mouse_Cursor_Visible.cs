using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Mouse_Cursor_Visible : MonoBehaviour
{
    public bool showCursorAtStart = true;

    private void Start()
    {
        StartCoroutine(DelayedStartCoroutine());        
    }

    private IEnumerator DelayedStartCoroutine()
    {
        yield return new WaitForSeconds(0.1f);
        if (showCursorAtStart == true)
        {
            CursorVisible();
        }
    }

    public void CursorVisible()
    {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }

    public void CursorNotVisible()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }    
}

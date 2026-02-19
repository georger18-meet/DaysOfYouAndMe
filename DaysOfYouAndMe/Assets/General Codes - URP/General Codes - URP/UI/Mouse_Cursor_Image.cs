using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Mouse_Cursor_Image : MonoBehaviour
{
    public Texture2D cursor1;
    public Texture2D cursor2;
    public bool ChangeCursorToCursor1AtStart = true;

    private void Start()
    {
        if (ChangeCursorToCursor1AtStart == true)
        {
            Cursor.SetCursor(cursor1, Vector2.zero, CursorMode.ForceSoftware);
        }
    }
 
    public void Cursor_Image_Change1()
    {
        Cursor.SetCursor(cursor1, Vector2.zero, CursorMode.ForceSoftware);
    }

    public void Cursor_Image_Change2()
    {
        Cursor.SetCursor(cursor2, Vector2.zero, CursorMode.ForceSoftware);
    }

    public void Cursor_Image_Default()
    {
        Cursor.SetCursor(null, Vector2.zero, CursorMode.ForceSoftware);
    }
}

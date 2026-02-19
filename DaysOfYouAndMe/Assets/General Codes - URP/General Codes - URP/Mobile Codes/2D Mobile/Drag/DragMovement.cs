using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody2D))]

public class DragMovement : MonoBehaviour
{
    public bool boundToScreen = false;
    private Rigidbody2D rb;

    private void Start()
    {
        rb = GetComponent<Rigidbody2D>();
    }

    public void Update()
    {
        if (Input.GetMouseButton(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Moved))
        {
            Vector2 curScreenPoint = new Vector2(Input.mousePosition.x, Input.mousePosition.y);
            Vector2 curPosition = Camera.main.ScreenToWorldPoint(curScreenPoint);

            if (boundToScreen == true)
            {
                Bounds bounds = GetComponent<Collider2D>().bounds;
                Vector2 minScreenBounds = Camera.main.ScreenToWorldPoint(Vector2.zero) + bounds.extents;
                Vector2 maxScreenBounds = Camera.main.ScreenToWorldPoint(new Vector2(Screen.width, Screen.height)) - bounds.extents;
                curPosition.x = Mathf.Clamp(curPosition.x, minScreenBounds.x, maxScreenBounds.x);
                curPosition.y = Mathf.Clamp(curPosition.y, minScreenBounds.y, maxScreenBounds.y);
            }

            rb.MovePosition(curPosition);
        }
    }
}

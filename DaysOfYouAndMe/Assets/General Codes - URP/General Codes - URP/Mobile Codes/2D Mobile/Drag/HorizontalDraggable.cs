using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class HorizontalDraggable : MonoBehaviour
{
    public bool blockedByUI = false;

    public UnityEvent onDragStart;
    public UnityEvent onDragEnd;

    private bool isDragging = false;
    private Vector3 offset;
    private Vector3 mousePos;
    private float minX;
    private float maxX;


    private void Update()
    {
        // Check if pointer is over UI, if so, return
        if (blockedByUI == true && EventSystem.current.IsPointerOverGameObject() || EventSystem.current.currentSelectedGameObject != null)
        {
            return;
        }

        if (isDragging)
        {
            mousePos = Input.mousePosition;
            Vector3 newPosition = Camera.main.ScreenToWorldPoint(mousePos) + offset;
            newPosition.x = Mathf.Clamp(newPosition.x, minX, maxX);
            transform.position = new Vector3(newPosition.x, transform.position.y, transform.position.z);
        }

        if (Input.GetMouseButtonDown(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began))
        {
            StartDrag();
        }

        if (Input.GetMouseButtonUp(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Ended))
        {
            EndDrag();
        }

        CalculateScreenBounds();
    }

    private void CalculateScreenBounds()
    {
        // Calculate the screen bounds in world space
        Vector3 minScreenBounds = Camera.main.ScreenToWorldPoint(Vector3.zero);
        Vector3 maxScreenBounds = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, 0));

        // Adjust the screen bounds based on collider size
        Collider2D collider = GetComponent<Collider2D>();
        if (collider != null)
        {
            minScreenBounds += new Vector3(collider.bounds.extents.x, 0, 0);
            maxScreenBounds -= new Vector3(collider.bounds.extents.x, 0, 0);
        }

        minX = minScreenBounds.x;
        maxX = maxScreenBounds.x;
    }

    private void StartDrag()
    {
        RaycastHit2D hit = Physics2D.GetRayIntersection(Camera.main.ScreenPointToRay(Input.mousePosition));

        if (hit.collider != null && hit.collider.gameObject == this.gameObject)
        {
            // Calculate offset from mouse position to object position          
            mousePos = Input.mousePosition;
            offset = transform.position - Camera.main.ScreenToWorldPoint(mousePos);
            isDragging = true;
            onDragStart.Invoke();
        }
    }

    private void EndDrag()
    {
        isDragging = false;
        onDragEnd.Invoke();
    }
}

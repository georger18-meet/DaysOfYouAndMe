using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class TwoD_MobileDraggable_Ortho : MonoBehaviour
{
    public bool blockedByUI = false;
    
    public UnityEvent onDragStart;
    public UnityEvent onDragEnd;

    private bool isDragging = false;
    private Vector3 offset;
    private Vector3 mousePos;
    private Vector3 minScreenBounds;
    private Vector3 maxScreenBounds;

    private void Start()
    {
        CalculateScreenBounds();
    }

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
            newPosition.x = Mathf.Clamp(newPosition.x, minScreenBounds.x, maxScreenBounds.x);
            newPosition.y = Mathf.Clamp(newPosition.y, minScreenBounds.y, maxScreenBounds.y);
            transform.position = newPosition;
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
        minScreenBounds = Camera.main.ScreenToWorldPoint(Vector3.zero);
        maxScreenBounds = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, 0));

        // Adjust the screen bounds based on collider size
        Collider2D collider = GetComponent<Collider2D>();
        if (collider != null)
        {
            minScreenBounds += new Vector3(collider.bounds.extents.x, collider.bounds.extents.y, 0);
            maxScreenBounds -= new Vector3(collider.bounds.extents.x, collider.bounds.extents.y, 0);
        }
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

using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using System.Collections.Generic;

public class ThreeD_MobileDragObject_LineRenderer : MonoBehaviour
{
    public Material lineMaterial;
    public Vector3 offset = new Vector3(0f, 0.1f, 0f);
    public string dragTag = "Drag";
    public bool showLineRenderer = true;
    public LayerMask invalidDropLayer;
    public LayerMask validDropLayer; 
    public UnityEvent onDragCompleted;
    public UnityEvent onInvalidDrop;
    public UnityEvent onValidDrop; 

    private GameObject draggedObject;
    private LineRenderer lineRenderer;
    private List<Vector3> linePositions = new List<Vector3>();

    void Start()
    {
        GameObject lineObject = new GameObject("LineRenderer");
        lineRenderer = lineObject.AddComponent<LineRenderer>();
        lineRenderer.material = lineMaterial;
        lineRenderer.startWidth = 0.1f;
        lineRenderer.endWidth = 0.1f;
        lineRenderer.enabled = false;
        Cursor.lockState = CursorLockMode.Confined;
    }

    void Update()
    {
        if (EventSystem.current.IsPointerOverGameObject() || EventSystem.current.currentSelectedGameObject != null)
        {
            return;
        }

        if (Input.GetMouseButtonDown(0))
        {
            CheckObjectUnderCursor();
        }

        if (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began)
        {
            CheckObjectUnderTouch();
        }

        if (draggedObject != null)
        {
            Vector3 newPosition;
            if (Input.touchCount > 0)
                newPosition = GetTouchWorldPosition();
            else
                newPosition = GetMouseWorldPosition();


            linePositions.Add(newPosition);
            UpdateLineRenderer();


            if (((Input.touchCount == 0 && !Input.GetMouseButton(0)) || (Input.GetMouseButtonUp(0))))
            {
                lineRenderer.enabled = false;
                if (linePositions.Count > 0)
                {
                    if (IsInvalidDrop())
                    {
                        Debug.Log("Invalid drop detected.");
                        onInvalidDrop.Invoke();
                    }
                    else if (IsValidDrop()) 
                    {
                        draggedObject.transform.position = linePositions[linePositions.Count - 1] + offset;
                        onValidDrop.Invoke();
                    }
                    else
                    {
                        draggedObject.transform.position = linePositions[linePositions.Count - 1] + offset;
                        onDragCompleted.Invoke();
                    }
                }
                draggedObject = null; 
            }
        }
    }

    Vector3 GetMouseWorldPosition()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit))
        {
            return hit.point;
        }
        return Vector3.zero;
    }

    Vector3 GetTouchWorldPosition()
    {
        Vector3 touchPosition = Input.GetTouch(0).position;
        Ray ray = Camera.main.ScreenPointToRay(touchPosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit))
        {
            return hit.point;
        }
        return Vector3.zero;
    }

    void CheckObjectUnderCursor()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit))
        {
            if (hit.collider.CompareTag(dragTag))
            {
                SetDraggedObject(hit.collider.gameObject);
            }
        }
    }

    void CheckObjectUnderTouch()
    {
        Vector3 touchPosition = Input.GetTouch(0).position;
        Ray ray = Camera.main.ScreenPointToRay(touchPosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit))
        {
            if (hit.collider.CompareTag(dragTag))
            {
                SetDraggedObject(hit.collider.gameObject);
            }
        }
    }

    void UpdateLineRenderer()
    {
        lineRenderer.positionCount = linePositions.Count;
        for (int i = 0; i < linePositions.Count; i++)
        {
            lineRenderer.SetPosition(i, linePositions[i]);
        }
    }

    void SetDraggedObject(GameObject obj)
    {
        draggedObject = obj;
        linePositions.Clear();
        lineRenderer.enabled = showLineRenderer;
        linePositions.Add(draggedObject.transform.position);
    }

    bool IsInvalidDrop()
    {
        RaycastHit hit;
        if (Physics.Raycast(linePositions[linePositions.Count - 1] + offset, Vector3.down, out hit, Mathf.Infinity, invalidDropLayer))
        {
            return true;
        }
        return false;
    }

    bool IsValidDrop()
    {
        RaycastHit hit;
        if (Physics.Raycast(linePositions[linePositions.Count - 1] + offset, Vector3.down, out hit, Mathf.Infinity, validDropLayer))
        {
            return true;
        }
        return false;
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Events;

public class ScreenSwiper : MonoBehaviour, IDragHandler, IEndDragHandler
{
    public UnityEvent onSwipeUp;
    public UnityEvent onSwipeDown;
    public UnityEvent onSwipeLeft;
    public UnityEvent onSwipeRight;

    public void OnDrag(PointerEventData eventData)
    {

    }

    public void OnEndDrag(PointerEventData eventData)
    {
        Vector3 dragVectorDirection = (eventData.position - eventData.pressPosition).normalized;
        GetDragDirection(dragVectorDirection);
    }

    private enum DraggedDirection
    {
        Up,
        Down,
        Right,
        Left
    }

    private void GetDragDirection(Vector3 dragVector)
    {
        float positiveX = Mathf.Abs(dragVector.x);
        float positiveY = Mathf.Abs(dragVector.y);
        DraggedDirection draggedDir;
        if (positiveX > positiveY)
        {
            draggedDir = (dragVector.x > 0) ? DraggedDirection.Right : DraggedDirection.Left;
        }
        else
        {
            draggedDir = (dragVector.y > 0) ? DraggedDirection.Up : DraggedDirection.Down;
        }

        // Invoke corresponding Unity events
        switch (draggedDir)
        {
            case DraggedDirection.Up:
                onSwipeUp.Invoke();
                break;
            case DraggedDirection.Down:
                onSwipeDown.Invoke();
                break;
            case DraggedDirection.Left:
                onSwipeLeft.Invoke();
                break;
            case DraggedDirection.Right:
                onSwipeRight.Invoke();
                break;
        }
    }
}

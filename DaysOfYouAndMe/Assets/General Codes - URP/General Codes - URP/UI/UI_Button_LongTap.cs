using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class UI_Button_LongTap : MonoBehaviour, IPointerDownHandler, IPointerUpHandler
{
    public float longTapDuration = 1.0f; // Adjust as needed
    public UnityEvent onLongTap;

    private bool isTouching = false;
    private float touchStartTime;

    private void Update()
    {
        if (isTouching && Time.time - touchStartTime >= longTapDuration)
        {
            onLongTap.Invoke();
            isTouching = false; // Reset touch state after long tap
        }
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        touchStartTime = Time.time;
        isTouching = true;
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        isTouching = false; // Reset touch state if touch is released
    }
}

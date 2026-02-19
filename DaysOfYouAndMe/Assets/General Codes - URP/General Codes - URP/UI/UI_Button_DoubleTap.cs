using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class UI_Button_DoubleTap : MonoBehaviour
{
    private float lastTapTime;
    public float doubleTapTimeThreshold = 0.2f; // Adjust as needed
    public UnityEvent onDoubleTap;

    private Button button;

    private void Start()
    {
        button = GetComponent<Button>();
        if (button != null)
        {
            button.onClick.AddListener(OnButtonClick);
        }
        else
        {
            Debug.LogError("UIButtonDoubleTap script must be attached to a UI Button.");
        }
    }

    private void OnButtonClick()
    {
        float timeSinceLastTap = Time.time - lastTapTime;

        if (timeSinceLastTap < doubleTapTimeThreshold)
        {
            onDoubleTap.Invoke();
        }

        lastTapTime = Time.time;
    }
}

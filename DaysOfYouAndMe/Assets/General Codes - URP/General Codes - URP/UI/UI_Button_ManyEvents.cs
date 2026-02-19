using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class UI_Button_ManyEvents : MonoBehaviour
{
    public bool loopEvents = false;
    public UnityEvent[] buttonEvents;    
    private int tapCount = 0;

    private void Start()
    {
        // Get the Button component attached to this game object
        Button button = GetComponent<Button>();

        // Add a listener for the button's onClick event
        button.onClick.AddListener(OnClick);
    }

    private void OnClick()
    {
        if (tapCount < buttonEvents.Length)
        {
            buttonEvents[tapCount].Invoke();
            tapCount++;
        }
        else
        {
            if (loopEvents)
            {
                tapCount = 0; // Reset tapCount to loop events
                buttonEvents[tapCount].Invoke();
                tapCount++;
            }
            else
            {
                enabled = false; // Disable the script after all events are invoked
            }
        }
    }
}

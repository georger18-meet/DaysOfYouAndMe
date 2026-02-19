using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;

public class UI_Toggle_Events : MonoBehaviour
{
    private Toggle toggleButton;
    public UnityEvent ToggleOn;
    public UnityEvent ToggleOff;

    void Start()
    {
        toggleButton = this.GetComponent<Toggle>();
        toggleButton.isOn = false;
        toggleButton.onValueChanged.AddListener(OnToggleValueChanged);
    }

    void OnToggleValueChanged(bool isOn)
    {
        
        if (isOn)
        {
            ToggleOn.Invoke();
        }
        else
        {
            ToggleOff.Invoke();
        }
    }
}

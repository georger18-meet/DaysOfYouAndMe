using UnityEngine;
using UnityEngine.Events;
using TMPro;

public class TMPDropdownEventInvoker : MonoBehaviour
{
    [Tooltip("Reference to the TMP Dropdown component.")]
    public TMP_Dropdown dropdown;

    [System.Serializable]
    public class DropdownOptionEvent : UnityEvent { }

    [Tooltip("List of Unity Events for each Dropdown option. Add events in the same order as the dropdown options.")]
    public DropdownOptionEvent[] optionEvents;

    private void Start()
    {
        // Make sure the TMP Dropdown is assigned and has the required events
        if (dropdown == null)
        {
            Debug.LogError("TMP Dropdown component not assigned.");
            return;
        }

        if (optionEvents == null || optionEvents.Length != dropdown.options.Count)
        {
            Debug.LogError("Number of option events must match the number of TMP dropdown options.");
            return;
        }

        // Add a listener to invoke the corresponding event when an option is selected
        dropdown.onValueChanged.AddListener(OnDropdownValueChanged);
    }

    private void OnDropdownValueChanged(int selectedIndex)
    {
        if (selectedIndex >= 0 && selectedIndex < optionEvents.Length)
        {
            optionEvents[selectedIndex]?.Invoke();
        }
    }
}

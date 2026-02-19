using UnityEngine;
using UnityEngine.Events;

public class ExamineObject : MonoBehaviour
{
    private Vector3 initialPosition;
    private Quaternion initialRotation;
    private Vector3 initialScale;
    private Transform initialParent;

    public Transform targetPosition; // The position to move the GameObject to
    public KeyCode returnKey = KeyCode.Mouse1; // Default to right mouse button for return action

    public UnityEvent onPickUp; // UnityEvent for the pick up method
    public UnityEvent onReturn; // UnityEvent for the return method

    void Start()
    {
        // Store the initial position, rotation, scale, and parent of the GameObject
        initialPosition = transform.position;
        initialRotation = transform.rotation;
        initialScale = transform.localScale;
        initialParent = transform.parent;
    }

    void Update()
    {
        // Check if the return key is pressed
        if (Input.GetKeyDown(returnKey))
        {
            Return();
        }
    }

    public void PickUp()
    {
        // Move and parent the GameObject to the target position
        if (targetPosition != null)
        {
            transform.position = targetPosition.position;
            transform.rotation = targetPosition.rotation;
            transform.SetParent(targetPosition);
            // Invoke the UnityEvent
            onPickUp?.Invoke();
        }
        else
        {
            Debug.LogWarning("Target position is not set.");
        }
    }

    public void Return()
    {
        // Unparent and move the GameObject back to its initial position, rotation, and scale
        transform.SetParent(initialParent);
        transform.position = initialPosition;
        transform.rotation = initialRotation;
        transform.localScale = initialScale;
        // Invoke the UnityEvent
        onReturn?.Invoke();
    }
}

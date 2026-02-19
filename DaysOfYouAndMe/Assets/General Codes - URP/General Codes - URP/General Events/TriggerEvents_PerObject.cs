using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

[RequireComponent(typeof(CapsuleCollider))]
public class TriggerEvents_PerObject : MonoBehaviour
{
    public LayerMask triggerLayer;
    public float triggerEnterDelayTime = 0f;
    public float triggerExitDelayTime = 0f;

    public UnityEvent onTriggerEnter;
    public UnityEvent onTriggerExit;

    private CapsuleCollider objectCollider;
    private HashSet<GameObject> objectsInTrigger = new HashSet<GameObject>();

    private float previousRadius;

    private void Start()
    {
        // Get the capsule collider component of the GameObject
        objectCollider = GetComponent<CapsuleCollider>();

        previousRadius = objectCollider.radius;

        UpdateTriggerRadius();
    }

    private void Update()
    {
        if (objectCollider.radius != previousRadius)
        {
            UpdateTriggerRadius();
            previousRadius = objectCollider.radius;
        }

        Vector3 capsuleCenter = transform.position + objectCollider.center;

        // Calculate the trigger radius based on the capsule collider's properties
        float triggerRadius = Mathf.Max(objectCollider.radius * transform.lossyScale.x, objectCollider.height * 0.5f * transform.lossyScale.y);

        Collider[] colliders = Physics.OverlapSphere(capsuleCenter, triggerRadius, triggerLayer);

        // Handle objects entering the trigger zone
        foreach (Collider collider in colliders)
        {
            GameObject obj = collider.gameObject;
            if (!objectsInTrigger.Contains(obj))
            {
                objectsInTrigger.Add(obj);
                StartCoroutine(TriggerEnterDelayedCoroutine());
            }
        }

        // Handle objects exiting the trigger zone
        List<GameObject> objectsToRemove = new List<GameObject>();
        foreach (GameObject obj in objectsInTrigger)
        {
            if (!collidersExists(colliders, obj))
            {
                objectsToRemove.Add(obj);
                StartCoroutine(TriggerExitDelayedCoroutine());
            }
        }

        // Remove exited objects from the trigger list
        foreach (GameObject obj in objectsToRemove)
        {
            objectsInTrigger.Remove(obj);
        }
    }

    private bool collidersExists(Collider[] colliders, GameObject obj)
    {
        foreach (Collider collider in colliders)
        {
            if (collider.gameObject == obj)
                return true;
        }
        return false;
    }

    private IEnumerator TriggerEnterDelayedCoroutine()
    {
        yield return new WaitForSeconds(triggerEnterDelayTime);
        onTriggerEnter.Invoke();
    }

    private IEnumerator TriggerExitDelayedCoroutine()
    {
        yield return new WaitForSeconds(triggerExitDelayTime);
        onTriggerExit.Invoke();
    }

    private void UpdateTriggerRadius()
    {
        // Adjust the trigger radius based on the capsule collider's radius and scale
        float triggerRadius = Mathf.Max(objectCollider.radius * transform.lossyScale.x, objectCollider.height * 0.5f * transform.lossyScale.y);
        objectCollider.radius = triggerRadius;
    }
}

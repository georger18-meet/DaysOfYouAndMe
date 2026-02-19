using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class TriggerEvents_PerObject2D : MonoBehaviour
{
    public LayerMask triggerLayer;
    public float triggerRadius = 1f;
    public float triggerEnterDelayTime = 0f;
    public float triggerExitDelayTime = 0f;

    public UnityEvent onTriggerEnter;
    public UnityEvent onTriggerExit;

    private List<GameObject> objectsInTrigger = new List<GameObject>();

    private void Update()
    {
        Collider2D[] colliders = Physics2D.OverlapCircleAll(transform.position, triggerRadius, triggerLayer);

        foreach (Collider2D collider in colliders)
        {
            GameObject obj = collider.gameObject;
            if (!objectsInTrigger.Contains(obj))
            {
                objectsInTrigger.Add(obj);
                StartCoroutine(TriggerEnterDelayedCoroutine(obj));
            }
        }

        for (int i = objectsInTrigger.Count - 1; i >= 0; i--)
        {
            GameObject obj = objectsInTrigger[i];
            if (!collidersExists(colliders, obj))
            {
                objectsInTrigger.Remove(obj);
                StartCoroutine(TriggerExitDelayedCoroutine(obj));
            }
        }
    }

    private bool collidersExists(Collider2D[] colliders, GameObject obj)
    {
        foreach (Collider2D collider in colliders)
        {
            if (collider.gameObject == obj)
                return true;
        }
        return false;
    }

    private IEnumerator TriggerEnterDelayedCoroutine(GameObject obj)
    {
        yield return new WaitForSeconds(triggerEnterDelayTime);
        if (objectsInTrigger.Contains(obj))
            onTriggerEnter.Invoke();
    }

    private IEnumerator TriggerExitDelayedCoroutine(GameObject obj)
    {
        yield return new WaitForSeconds(triggerExitDelayTime);
        if (!collidersExists(Physics2D.OverlapCircleAll(transform.position, triggerRadius, triggerLayer), obj))
            onTriggerExit.Invoke();
    }
}

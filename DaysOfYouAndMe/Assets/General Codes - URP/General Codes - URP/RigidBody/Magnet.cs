using UnityEngine;
using UnityEngine.Events;

public class Magnet : MonoBehaviour
{
    public float magnetForce = 15.0f;
    public bool enable = true;
    public bool attract = true;
    public float innerRadius = 2.0f;
    public float outerRadius = 5.0f;
    public bool realismMode = false;
    public UnityEvent<Collider> onAffect;

    void FixedUpdate()
    {
        if (enable)
        {
            Collider[] objects = Physics.OverlapSphere(transform.position, outerRadius);
            foreach (Collider col in objects)
            {
                if (col.GetComponent<Rigidbody>())
                { // Must be rigidbody
                    attractOrRepel(col);
                }
            }
        }
    }

    void attractOrRepel(Collider col)
    {
        if (Vector3.Distance(transform.position, col.transform.position) > innerRadius)
        {
            // Apply force in direction of magnet center
            if (realismMode)
            {
                float dynamicDistance = Mathf.Abs(Vector3.Distance(transform.position, col.transform.position) - (outerRadius + (innerRadius * 2)));
                float multiplier = dynamicDistance / outerRadius;

                if (attract)
                {
                    col.GetComponent<Rigidbody>().AddForce((magnetForce * (transform.position - col.transform.position).normalized) * multiplier, ForceMode.Force);
                }
                else
                {
                    col.GetComponent<Rigidbody>().AddForce(-(magnetForce * (transform.position - col.transform.position).normalized) * multiplier, ForceMode.Force);
                }
            }
            else
            {
                if (attract)
                {
                    col.GetComponent<Rigidbody>().AddForce(magnetForce * (transform.position - col.transform.position).normalized, ForceMode.Force);
                }
                else
                {
                    col.GetComponent<Rigidbody>().AddForce(-magnetForce * (transform.position - col.transform.position).normalized, ForceMode.Force);
                }
            }
        }
        else
        {
            // Inner Radius float gentle - Future additional handling here
        }

        onAffect?.Invoke(col);
    }

    void OnDrawGizmos()
    {
        if (enable)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, outerRadius);
            Gizmos.color = Color.yellow;
            Gizmos.DrawWireSphere(transform.position, innerRadius);
            Gizmos.DrawIcon(transform.position, "sptk_magnet.png", true);
        }
    }
}

using UnityEngine;

public class SlideOnGround : MonoBehaviour
{
    public Transform lowerTip;    // Reference to the lower tip of the object
    public LayerMask groundLayer;  // The layer(s) considered as ground
    public float groundOffset = 0.0f; // Optional offset from the ground

    private void LateUpdate()
    {
        // Cast a ray downward from the lower tip's position
        RaycastHit hit;
        if (Physics.Raycast(lowerTip.position, Vector3.down, out hit, Mathf.Infinity, groundLayer))
        {
            // Calculate the difference in height
            float distanceToGround = lowerTip.position.y - hit.point.y;

            // Move the object down to align the lower tip with the ground
            transform.position -= new Vector3(0, distanceToGround - groundOffset, 0);
        }
    }

    private void OnDrawGizmosSelected()
    {
        // Visualize the raycast in the Scene view
        if (lowerTip != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawLine(lowerTip.position, lowerTip.position + Vector3.down * 10f);
        }
    }
}

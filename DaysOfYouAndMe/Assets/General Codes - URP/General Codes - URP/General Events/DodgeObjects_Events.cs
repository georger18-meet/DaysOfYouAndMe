using UnityEngine;
using UnityEngine.Events;

public class DodgeObjects_Events : MonoBehaviour
{
    public GameObject objectPrefab;
    public Transform spawnPoint;
    public float spawnInterval = 2.0f;
    public float objectSpeed = 50.0f;
    public float objectLifetime = 5.0f; // Time before the object is destroyed
    public string playerTag = "Player"; // Tag used to find the player object
    public float playAreaRadius = 2.5f; // Radius of the play area around the player for dodge detection

    public UnityEvent onHitPlayer;   // Event triggered when the object hits the player
    public UnityEvent onDodgePlayer; // Event triggered when the object misses the player

    private Transform playerTransform;

    void Start()
    {
        // Find the player by the specified tag at the start
        GameObject player = GameObject.FindGameObjectWithTag(playerTag);
        if (player != null)
        {
            playerTransform = player.transform;
            Debug.Log("Player found: " + player.name);
        }
        else
        {
            Debug.LogError("Player object not found with tag: " + playerTag);
        }

        if (objectPrefab == null || spawnPoint == null)
        {
            Debug.LogError("ObjectPrefab or SpawnPoint is not assigned.");
            return;
        }

        InvokeRepeating(nameof(SpawnObject), 1.0f, spawnInterval);
    }

    void SpawnObject()
    {
        if (playerTransform == null)
        {
            Debug.LogWarning("Cannot spawn objects because the player transform is not set.");
            return;
        }

        // Log when an object is about to be spawned
        Debug.Log("Spawning object at: " + spawnPoint.position);

        // Instantiate the object at the spawn point
        GameObject obj = Instantiate(objectPrefab, spawnPoint.position, Quaternion.identity);

        if (obj == null)
        {
            Debug.LogError("Failed to instantiate objectPrefab.");
            return;
        }

        // Ensure the instantiated object has the necessary components
        Rigidbody rb = obj.GetComponent<Rigidbody>();
        Collider col = obj.GetComponent<Collider>();

        if (rb == null || col == null)
        {
            Debug.LogError("The objectPrefab must have both Rigidbody and Collider components.");
            Destroy(obj);
            return;
        }

        // Set Rigidbody properties
        rb.collisionDetectionMode = CollisionDetectionMode.ContinuousDynamic;
        rb.interpolation = RigidbodyInterpolation.Interpolate;

        // Calculate the direction towards the player's current position
        Vector3 directionToPlayer = (playerTransform.position - spawnPoint.position).normalized;

        // Apply velocity towards the player
        rb.linearVelocity = directionToPlayer * objectSpeed;

        // Attach a script to handle collision detection and dodge event
        ObjectCollisionHandler collisionHandler = obj.AddComponent<ObjectCollisionHandler>();
        collisionHandler.Initialize(playerTag, onHitPlayer, onDodgePlayer, playerTransform, playAreaRadius);

        // Schedule the object to be destroyed after its lifetime expires
        Destroy(obj, objectLifetime);
    }

    // Inner class to handle collision detection
    private class ObjectCollisionHandler : MonoBehaviour
    {
        private string playerTag;
        private UnityEvent onHitPlayer;
        private UnityEvent onDodgePlayer;
        private Transform playerTransform;
        private float playAreaRadius;

        private bool hasCollided = false;
        private bool isInPlayArea = false;

        public void Initialize(string playerTag, UnityEvent onHitPlayer, UnityEvent onDodgePlayer, Transform playerTransform, float playAreaRadius)
        {
            this.playerTag = playerTag;
            this.onHitPlayer = onHitPlayer;
            this.onDodgePlayer = onDodgePlayer;
            this.playerTransform = playerTransform;
            this.playAreaRadius = playAreaRadius;

            // Start a coroutine to check for dodge after the object has moved towards the player
            StartCoroutine(CheckForDodge());
        }

        void OnCollisionEnter(Collision collision)
        {
            if (collision.collider.CompareTag(playerTag))
            {
                hasCollided = true;
                onHitPlayer?.Invoke();
                Destroy(gameObject); // Destroy the object upon collision with the player
            }
        }

        private System.Collections.IEnumerator CheckForDodge()
        {
            while (true)
            {
                // Check if the object is within the play area
                if (Vector3.Distance(transform.position, playerTransform.position) <= playAreaRadius)
                {
                    isInPlayArea = true;
                }
                else
                {
                    // If the object leaves the play area and hasn't collided with the player, trigger dodge event
                    if (isInPlayArea && !hasCollided)
                    {
                        Debug.Log("Object out of play area, triggering dodge.");
                        onDodgePlayer?.Invoke();
                        Destroy(gameObject); // Destroy the object if it leaves the play area
                        yield break;
                    }
                }

                // Continue checking every frame
                yield return null;
            }
        }
    }

    // Gizmo to visualize the play area
    private void OnDrawGizmos()
    {
        if (playerTransform != null)
        {
            Gizmos.color = Color.yellow; // Color of the play area gizmo
            Vector3 playerPosition = playerTransform.position;
            Vector3 planeNormal = playerTransform.up; // Plane normal should be aligned with the Z-axis
            float planeSize = playAreaRadius * 2; // Size of the plane

            // Draw the plane representing the play area
            Gizmos.matrix = Matrix4x4.TRS(
                playerPosition + planeNormal * (playAreaRadius / 2),
                Quaternion.Euler(0, 0, 90), // Rotate the plane 90 degrees around the Z-axis
                new Vector3(planeSize, 0.1f, planeSize)
            );
            Gizmos.DrawWireCube(Vector3.zero, new Vector3(planeSize, 0.1f, planeSize));
            Gizmos.matrix = Matrix4x4.identity; // Reset the Gizmo matrix
        }
    }
}

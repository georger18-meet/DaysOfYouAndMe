using UnityEngine;

public class SavePointManager : MonoBehaviour
{
    public static SavePointManager Instance; // Singleton instance

    private Transform respawnPoint;
    public GameObject player; // Reference to the player GameObject

    void Awake()
    {
        // Singleton pattern to ensure only one instance exists
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject); // Destroy duplicate instances
        }

        respawnPoint = transform; // Default respawn point at the manager's transform
    }

    public void UpdateRespawnPoint(Transform newRespawnPoint)
    {
        respawnPoint = newRespawnPoint;
    }

    public void RespawnToLastSavedPoint()
    {
        if (player == null)
        {
            Debug.LogWarning("Player reference not set.");
            return;
        }

        player.transform.position = respawnPoint.position;
        player.transform.rotation = respawnPoint.rotation;
    }
}

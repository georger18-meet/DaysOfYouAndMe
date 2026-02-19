using UnityEngine;

public class PlatformSpawner : MonoBehaviour
{
    public GameObject platformPrefab;
    public float spawnDelay = 1f;
    public float initialSpawnHeightPercentage = 0.001f;
    public float minSpawnHeightPercentage = 0.5f;
    public float maxSpawnHeightPercentage = 0.6f;
    public float platformLifetime = 15f;

    private float lastSpawnPositionY;
    private float lastSpawnPositionX;
    private float lastSpawnDirection = 1f; // Initial direction

    void Start()
    {
        lastSpawnPositionY = Camera.main.transform.position.y;
        lastSpawnPositionX = 0f; // Start from the center
        InvokeRepeating("SpawnPlatform", 0f, spawnDelay);
    }

    void SpawnPlatform()
    {
        float spawnHeight;

        if (lastSpawnPositionY == Camera.main.transform.position.y)
        {
            spawnHeight = lastSpawnPositionY + (Camera.main.orthographicSize * initialSpawnHeightPercentage);
        }
        else
        {
            spawnHeight = lastSpawnPositionY + Random.Range(Camera.main.orthographicSize * minSpawnHeightPercentage, Camera.main.orthographicSize * maxSpawnHeightPercentage);
        }

        // Adjust the direction based on the screen edge
        if (lastSpawnPositionX + lastSpawnDirection * Camera.main.aspect * Camera.main.orthographicSize >= Camera.main.aspect * Camera.main.orthographicSize)
        {
            lastSpawnDirection = -1f; // Move left
        }
        else if (lastSpawnPositionX + lastSpawnDirection * Camera.main.aspect * Camera.main.orthographicSize <= -Camera.main.aspect * Camera.main.orthographicSize)
        {
            lastSpawnDirection = 1f; // Move right
        }

        // Adjust spawn position to make sure it can be all the way to the right or left
        float spawnX = lastSpawnPositionX + lastSpawnDirection * Random.Range(Camera.main.aspect * Camera.main.orthographicSize / 2f, Camera.main.aspect * Camera.main.orthographicSize);

        Vector3 spawnPosition = new Vector3(spawnX, spawnHeight, 0f);
        GameObject newPlatform = Instantiate(platformPrefab, spawnPosition, Quaternion.identity);

        Destroy(newPlatform, platformLifetime);

        lastSpawnPositionY = spawnHeight;
        lastSpawnPositionX = spawnX;
    }
}

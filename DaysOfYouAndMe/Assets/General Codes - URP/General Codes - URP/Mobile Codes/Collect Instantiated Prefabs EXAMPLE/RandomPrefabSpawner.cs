using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class RandomPrefabSpawner : MonoBehaviour
{
    [System.Serializable]
    public class PrefabProbability
    {
        public GameObject prefab;
        [Range(0f, 1f)] public float probability;
    }

    public List<PrefabProbability> prefabsWithProbability = new List<PrefabProbability>();
    public Transform spawnArea; // Public transform defining the spawn area
    public float minDelay = 0.5f;
    public float maxDelay = 1f;
    public float deleteCheckInterval = 5f; // Interval to check if prefab is off-screen
    public float minYOffset = -2.5f; // Minimum y offset
    public float maxYOffset = 5f; // Maximum y offset
    public float minSpacing = 1f; // Minimum spacing between prefabs
    public float maxSpacing = 5f; // Maximum spacing between prefabs

    private bool allowInstantiation = true;
    private List<GameObject> spawnedPrefabs = new List<GameObject>(); // Track spawned prefabs

    void Start()
    {
        StartCoroutine(InstantiateWithRandomDelay());
    }

    IEnumerator InstantiateWithRandomDelay()
    {
        while (true)
        {
            if (allowInstantiation)
            {
                float delay = Random.Range(minDelay, maxDelay);
                yield return new WaitForSeconds(delay);

                if (prefabsWithProbability.Count > 0)
                {
                    GameObject prefabToInstantiate = SelectPrefabWithProbability();

                    if (prefabToInstantiate != null)
                    {
                        Vector3 spawnPosition = GetRandomOffScreenSpawnPosition(prefabToInstantiate);
                        if (spawnPosition != Vector3.zero)
                        {
                            GameObject instantiatedPrefab = Instantiate(prefabToInstantiate, spawnPosition, Quaternion.identity);

                            // Apply spacing between prefabs
                            ApplyPrefabSpacing(instantiatedPrefab);

                            // Track instantiated prefab
                            spawnedPrefabs.Add(instantiatedPrefab);

                            // Start checking if prefab is off-screen
                            StartCoroutine(CheckPrefabOffScreen(instantiatedPrefab));
                        }
                    }
                    else
                    {
                        Debug.LogError("Prefab is null in the list!");
                    }
                }
                else
                {
                    Debug.LogError("No prefabs assigned to the list!");
                }
            }
            else
            {
                yield return null; // Wait without instantiating
            }
        }
    }

    Vector3 GetRandomOffScreenSpawnPosition(GameObject prefab)
    {
        if (spawnArea == null)
        {
            Debug.LogError("Spawn area transform is not assigned!");
            return Vector3.zero;
        }

        // Get spawn area position
        Vector3 spawnCenter = spawnArea.position;

        // Adjust these variables based on your specific needs
        int maxAttempts = 100;  // Maximum attempts to find a valid position
        float maxOffsetAttempts = 5f;  // Additional attempts factor for offset variations

        for (int attempt = 0; attempt < maxAttempts; attempt++)
        {
            Vector2 randomPoint = new Vector2(
                Random.Range(spawnCenter.x - 1f, spawnCenter.x + 1f), // Adjust range as needed
                Random.Range(spawnCenter.y - 1f, spawnCenter.y + 1f)  // Adjust range as needed
            );

            float randomYOffset = Random.Range(minYOffset, maxYOffset);
            Vector3 spawnPosition = new Vector3(randomPoint.x, randomPoint.y + randomYOffset, 0f);

            // Check if the spawn position is off-screen
            if (!IsPositionOnScreen(spawnPosition, prefab))
            {
                return spawnPosition;
            }

            // If the initial attempt fails, try additional attempts with different offsets
            for (int offsetAttempt = 0; offsetAttempt < maxOffsetAttempts; offsetAttempt++)
            {
                float additionalOffset = Random.Range(minYOffset, maxYOffset);
                Vector3 offsetSpawnPosition = new Vector3(randomPoint.x, randomPoint.y + additionalOffset, 0f);

                if (!IsPositionOnScreen(offsetSpawnPosition, prefab))
                {
                    return offsetSpawnPosition;
                }
            }
        }

        //Debug.LogWarning("Failed to find valid off-screen spawn position after " + maxAttempts + " attempts.");
        return Vector3.zero;
    }

    bool IsPositionOnScreen(Vector3 position, GameObject prefab)
    {
        Vector3 screenPosition = Camera.main.WorldToViewportPoint(position);

        if (screenPosition.x < 0f || screenPosition.x > 1f || screenPosition.y < 0f || screenPosition.y > 1f)
        {
            return false; // Off-screen
        }

        return true; // On-screen
    }

    void ApplyPrefabSpacing(GameObject prefabInstance)
    {
        // Get the size of the prefab instance
        Bounds bounds = GetPrefabBounds(prefabInstance);

        // Calculate random spacing between prefabs
        float spacing = Random.Range(minSpacing, maxSpacing);

        // Apply spacing based on the direction of the spawn (assuming horizontal spawn)
        Vector3 spawnDirection = Vector3.right; // Adjust based on your spawn direction
        Vector3 spawnPosition = prefabInstance.transform.position;

        // Ensure spacing between current prefab and previously spawned prefabs
        foreach (GameObject otherPrefab in spawnedPrefabs)
        {
            Bounds otherBounds = GetPrefabBounds(otherPrefab);
            float totalSpacing = bounds.size.x / 2 + otherBounds.size.x / 2 + spacing;
            spawnPosition.x = Mathf.Max(spawnPosition.x, otherPrefab.transform.position.x + totalSpacing);
        }

        // Set the new position with spacing applied
        prefabInstance.transform.position = spawnPosition;
    }

    Bounds GetPrefabBounds(GameObject prefabInstance, Vector3 position = default)
    {
        Renderer[] renderers = prefabInstance.GetComponentsInChildren<Renderer>();
        Bounds bounds = renderers[0].bounds;
        foreach (Renderer renderer in renderers)
        {
            bounds.Encapsulate(renderer.bounds);
        }

        if (position != default)
        {
            bounds.center = position; // Set center to custom position if provided
        }
        else
        {
            bounds.center = prefabInstance.transform.position; // Use current prefab position if no position provided
        }

        return bounds;
    }

    IEnumerator CheckPrefabOffScreen(GameObject prefabInstance)
    {
        while (true)
        {
            yield return new WaitForSeconds(deleteCheckInterval);

            if (!IsPositionOnScreen(prefabInstance.transform.position, prefabInstance))
            {
                Destroy(prefabInstance);
                spawnedPrefabs.Remove(prefabInstance); // Remove from tracked list
                yield break; // Exit coroutine after destroying prefab
            }
        }
    }

    GameObject SelectPrefabWithProbability()
    {
        float totalProbability = 0f;
        foreach (var prefabProb in prefabsWithProbability)
        {
            totalProbability += prefabProb.probability;
        }

        float randomValue = Random.Range(0f, totalProbability);
        float cumulativeProbability = 0f;

        foreach (var prefabProb in prefabsWithProbability)
        {
            cumulativeProbability += prefabProb.probability;
            if (randomValue <= cumulativeProbability)
            {
                return prefabProb.prefab;
            }
        }

        return null;
    }

    public void StopInstantiation()
    {
        allowInstantiation = false;
    }

    public void ResumeInstantiation()
    {
        allowInstantiation = true;
    }

    public void ChangePrefabAtRuntime(GameObject newPrefab)
    {
        foreach (var prefabProb in prefabsWithProbability)
        {
            if (prefabProb.prefab == newPrefab)
            {
                Debug.LogWarning("Prefab already exists in the list!");
                return;
            }
        }

        // Replace the first prefab in the list with the new one
        if (prefabsWithProbability.Count > 0)
        {
            prefabsWithProbability[0].prefab = newPrefab;
        }
        else
        {
            Debug.LogError("No prefabs assigned to the list!");
        }
    }
}

using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class InstantiatePrefab : MonoBehaviour
{
    [System.Serializable]
    public class PrefabProbability
    {
        public GameObject prefab;
        [Range(0f, 1f)] public float probability;
    }

    public List<PrefabProbability> prefabsWithProbability = new List<PrefabProbability>();
    public Transform instantiationPosition;
    public float minDelay = 1f;
    public float maxDelay = 3f;
    public float deleteDelay = 5f; // Time to delete instantiated prefabs

    public bool allowInstantiation = true;

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
                        Vector3 spawnPosition = instantiationPosition != null ? instantiationPosition.position : transform.position;
                        GameObject instantiatedPrefab = Instantiate(prefabToInstantiate, spawnPosition, Quaternion.identity);
                        StartCoroutine(DeletePrefabAfterDelay(instantiatedPrefab, deleteDelay));
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

    IEnumerator DeletePrefabAfterDelay(GameObject prefabInstance, float delay)
    {
        yield return new WaitForSeconds(delay);
        Destroy(prefabInstance);
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

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SimpleRandomSpawner : MonoBehaviour
{
    public GameObject prefab;
    public float SpawnRate = 1;
    private float timer = 0;
    public float HeightOffset = 3;
    public float deleteDelay = 5f; // Time to delete instantiated prefabs

    // Start is called before the first frame update
    void Start()
    {
        SpawnPrefab();        
    }

    // Update is called once per frame
    void Update()
    {
        if (timer < SpawnRate)
        {
            timer = timer + Time.deltaTime;
        }
        else
        {
            SpawnPrefab();
            timer = 0;
        }
        
    }

    void SpawnPrefab()
    {
        float LowestPoint = transform.position.y - HeightOffset;
        float HighestPoint = transform.position.y + HeightOffset;

        GameObject instantiatedPrefab = Instantiate(prefab, new Vector3(transform.position.x, Random.Range(LowestPoint, HighestPoint), 0), transform.rotation);
        StartCoroutine(DeletePrefabAfterDelay(instantiatedPrefab, deleteDelay));
    }

    IEnumerator DeletePrefabAfterDelay(GameObject prefabInstance, float delay)
    {
        yield return new WaitForSeconds(delay);
        Destroy(prefabInstance);
    }

}

using UnityEngine;
using System.Collections;

public class EndlessBG_Spawner : MonoBehaviour
{
    public GameObject tilePrefab; // Prefab of the tile to be spawned
    public float spawnInterval = 1f; // Interval between spawns
    public Transform spawnPoint; // Point where new tiles will be spawned

    private void Start()
    {
        StartCoroutine(SpawnTilesAtIntervals());
    }

    private IEnumerator SpawnTilesAtIntervals()
    {
        while (true)
        {
            SpawnTile();
            yield return new WaitForSeconds(spawnInterval);
        }
    }

    private void SpawnTile()
    {
        // Instantiate a new tile at the spawn point with no rotation
        Instantiate(tilePrefab, spawnPoint.position, Quaternion.identity);
    }
}

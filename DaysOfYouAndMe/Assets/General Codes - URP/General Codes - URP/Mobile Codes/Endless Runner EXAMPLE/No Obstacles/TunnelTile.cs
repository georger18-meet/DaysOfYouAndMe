using UnityEngine;

public class TunnelTile : MonoBehaviour
{
    TunnelSpawner tunnelSpawner;

    private void Start()
    {
        tunnelSpawner = Object.FindAnyObjectByType<TunnelSpawner>();
    }

    private void OnTriggerExit(Collider other)
    {
        tunnelSpawner.SpawnTile(true);
        Destroy(gameObject, 2);
    }
}
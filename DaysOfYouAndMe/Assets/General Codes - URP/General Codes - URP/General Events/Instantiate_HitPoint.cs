using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Instantiate_HitPoint : MonoBehaviour
{
    public GameObject InstantiateThisPrefab;
    public bool matchSurfaceRotation = true;
    public KeyCode chooseKey = KeyCode.Mouse0;

    public bool instantiateManyPrefabs = true; // Allow user to choose single or multiple instantiation
    public Vector3 instantiationOffset = Vector3.zero; // Offset for instantiated object

    public UnityEvent PointWasHitEvent;
    
    private List<GameObject> instantiatedObjects = new List<GameObject>();

    private void Update()
    {
        if (Input.GetKeyDown(chooseKey))
        {
            CastClickRay();
        }
    }

    private void CastClickRay()
    {
        var camera = Camera.main;
        var mouseposition = Input.mousePosition;
        var ray = camera.ScreenPointToRay(new Vector3(mouseposition.x, mouseposition.y, camera.nearClipPlane));
        //if our ray hits a collider, and that collider is attached to this gameobject
        if (Physics.Raycast(ray, out var hit) && hit.collider.gameObject == this.gameObject)
        {
            if (!instantiateManyPrefabs)
            {
                ClearInstantiatedObjects();
            }

            Quaternion rotation = matchSurfaceRotation ? Quaternion.FromToRotation(Vector3.up, hit.normal) : Quaternion.identity;
            Vector3 position = hit.point + instantiationOffset;

            GameObject newObj = Instantiate(InstantiateThisPrefab, position, rotation, null);
            instantiatedObjects.Add(newObj);

            PointWasHitEvent.Invoke();
        }
    }

    public void SetPrefabToInstantiate(GameObject newPrefab)
    {
        InstantiateThisPrefab = newPrefab;
    }

    public void ClearInstantiatedObjects()
    {
        foreach (GameObject obj in instantiatedObjects)
        {
            Destroy(obj);
        }
        instantiatedObjects.Clear();
    }
}

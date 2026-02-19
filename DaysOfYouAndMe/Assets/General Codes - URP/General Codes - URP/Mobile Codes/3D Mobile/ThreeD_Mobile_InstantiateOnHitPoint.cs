using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class ThreeD_Mobile_InstantiateOnHitPoint: MonoBehaviour
{
    public GameObject InstantiateThisPrefab;
    public bool matchSurfaceRotation = true;
    public bool instantiateManyPrefabs = true; // Allow multiple instantiation
    public Vector3 instantiationOffset = Vector3.zero; // Offset for instantiated object

    public UnityEvent PointWasHitEvent;
    private List<GameObject> instantiatedPrefabs = new List<GameObject>();

    private void Update()
    {
        if (EventSystem.current.IsPointerOverGameObject() || EventSystem.current.currentSelectedGameObject != null)
            return;

        if (Input.GetMouseButtonDown(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began))
            CastClickRay();
    }

    private void CastClickRay()
    {
        var camera = Camera.main;
        var mouseposition = Input.mousePosition;
        var ray = camera.ScreenPointToRay(new Vector3(mouseposition.x, mouseposition.y, camera.nearClipPlane));

        if (Physics.Raycast(ray, out var hit) && hit.collider.gameObject == this.gameObject)
        {
            if (!instantiateManyPrefabs)
                ClearPrefabs();

            Quaternion rotation = matchSurfaceRotation ? Quaternion.FromToRotation(Vector3.up, hit.normal) : Quaternion.identity;
            Vector3 position = hit.point + instantiationOffset;

            GameObject newPrefab = Instantiate(InstantiateThisPrefab, position, rotation);
            instantiatedPrefabs.Add(newPrefab);

            PointWasHitEvent.Invoke();
        }
    }

    public void SetPrefabToInstantiate(GameObject newPrefab)
    {
        InstantiateThisPrefab = newPrefab;
    }

    public void ClearPrefabs()
    {
        foreach (GameObject prefab in instantiatedPrefabs)
        {
            Destroy(prefab);
        }

        instantiatedPrefabs.Clear();
    }
}

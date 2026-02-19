using System.Collections.Generic;
using UnityEngine;

public class Combine_SameMeshSameMaterial : MonoBehaviour
{
    public string targetTag = "CombineMesh"; // Assign a unique tag to the meshes you want to combine
    public Material combinedMaterial; // Assign the correct material in the Inspector

    void Awake()
    {
        CombineMeshesInScene();
    }

    void CombineMeshesInScene()
    {
        List<MeshFilter> meshFilters = new List<MeshFilter>();
        List<Vector2[]> uv2Data = new List<Vector2[]>();
        List<MeshRenderer> meshRenderersToDisable = new List<MeshRenderer>();
        List<GameObject> objectsToDelete = new List<GameObject>(); // List to store objects to delete

        GameObject[] objectsToCombine = GameObject.FindGameObjectsWithTag(targetTag);

        foreach (GameObject obj in objectsToCombine)
        {
            MeshFilter meshFilter = obj.GetComponent<MeshFilter>();
            MeshRenderer meshRenderer = obj.GetComponent<MeshRenderer>();

            if (meshFilter != null && meshRenderer != null)
            {
                meshFilters.Add(meshFilter);
                meshRenderersToDisable.Add(meshRenderer);
                objectsToDelete.Add(obj); // Add object to delete

                // Store UV2 data
                uv2Data.Add(meshFilter.sharedMesh.uv2);
            }
        }

        if (meshFilters.Count > 1)
        {
            List<CombineInstance> combineInstances = new List<CombineInstance>();

            for (int i = 0; i < meshFilters.Count; i++)
            {
                MeshFilter meshFilter = meshFilters[i];

                CombineInstance combineInstance = new CombineInstance
                {
                    mesh = meshFilter.sharedMesh,
                    transform = meshFilter.transform.localToWorldMatrix
                };

                combineInstances.Add(combineInstance);
            }

            Mesh combinedMesh = new Mesh();
            combinedMesh.indexFormat = UnityEngine.Rendering.IndexFormat.UInt32; // Use UInt32 index format
            combinedMesh.CombineMeshes(combineInstances.ToArray(), true);

            // Create a new GameObject for the combined mesh
            GameObject newObject = new GameObject("CombinedMesh");
            newObject.transform.parent = transform; // Parent the combined mesh to the MeshCombineManager

            // Reset the position and rotation of the new object to match the original objects
            newObject.transform.position = Vector3.zero;
            newObject.transform.rotation = Quaternion.identity;

            MeshFilter newMeshFilter = newObject.AddComponent<MeshFilter>();
            newMeshFilter.sharedMesh = combinedMesh;

            MeshRenderer newMeshRenderer = newObject.AddComponent<MeshRenderer>();

            // Assign the combined material from the Inspector
            newMeshRenderer.sharedMaterial = combinedMaterial;

            // Delete original objects
            foreach (GameObject objToDelete in objectsToDelete)
            {
                Destroy(objToDelete);
            }
        }
    }
}

using System.Collections.Generic;
using UnityEngine;

public class Combine_DiffMeshSameMaterial : MonoBehaviour
{
    [SerializeField] private GameObject parentObject; // Assign the parent GameObject that holds the MeshFilters
    [SerializeField] private Material combinedMaterial; // Assign the combined material in the Inspector
    public bool showMeshAtStart = true;

    private void Start()
    {
        CombineMeshes();
    }

    private Matrix4x4 CalculateCombinedTransform(Transform transform, Transform parentTransform)
    {
        Matrix4x4 combinedMatrix = Matrix4x4.identity;
        Transform currentTransform = transform;

        while (currentTransform != null && currentTransform != parentTransform)
        {
            combinedMatrix = Matrix4x4.TRS(currentTransform.localPosition, currentTransform.localRotation, currentTransform.localScale) * combinedMatrix;
            currentTransform = currentTransform.parent;
        }

        return combinedMatrix;
    }
    

    private void CombineMeshes()
    {
        List<MeshFilter> meshFiltersToCombine = new List<MeshFilter>();

        // Get all MeshFilters from the child objects of the parent GameObject
        MeshFilter[] childMeshFilters = parentObject.GetComponentsInChildren<MeshFilter>();
        meshFiltersToCombine.AddRange(childMeshFilters);

        if (meshFiltersToCombine.Count > 1)
        {
            List<Vector3> vertices = new List<Vector3>();
            List<Vector3> normals = new List<Vector3>();
            List<Vector2> uvs = new List<Vector2>();
            List<int> indices = new List<int>();

            Matrix4x4 parentCombinedMatrix = CalculateCombinedTransform(parentObject.transform, transform);

            foreach (MeshFilter meshFilter in meshFiltersToCombine)
            {
                Mesh mesh = meshFilter.sharedMesh;
                Matrix4x4 localToWorldMatrix = parentCombinedMatrix * CalculateCombinedTransform(meshFilter.transform, parentObject.transform);

                int vertexOffset = vertices.Count;

                Vector3[] meshVertices = mesh.vertices;
                for (int i = 0; i < meshVertices.Length; i++)
                {
                    Vector3 transformedVertex = localToWorldMatrix.MultiplyPoint3x4(meshVertices[i]);
                    vertices.Add(transformedVertex);
                }

                Vector3[] meshNormals = mesh.normals;
                for (int i = 0; i < meshNormals.Length; i++)
                {
                    Vector3 transformedNormal = localToWorldMatrix.MultiplyVector(meshNormals[i]);
                    normals.Add(transformedNormal);
                }

                Vector2[] meshUVs = mesh.uv;
                uvs.AddRange(meshUVs);

                int[] meshTriangles = mesh.triangles;
                for (int i = 0; i < meshTriangles.Length; i++)
                {
                    indices.Add(meshTriangles[i] + vertexOffset);
                }

                if (Application.isPlaying)
                {
                    Destroy(meshFilter.gameObject);
                }
            }

            Mesh combinedMesh = new Mesh();
            combinedMesh.indexFormat = UnityEngine.Rendering.IndexFormat.UInt32;
            combinedMesh.SetVertices(vertices);
            combinedMesh.SetNormals(normals);
            combinedMesh.SetUVs(0, uvs);
            combinedMesh.SetTriangles(indices, 0);

            GameObject newObject = new GameObject("CombinedMesh");
            newObject.transform.parent = transform;

            MeshFilter newMeshFilter = newObject.AddComponent<MeshFilter>();
            newMeshFilter.sharedMesh = combinedMesh;

            MeshRenderer newMeshRenderer = newObject.AddComponent<MeshRenderer>();
            newMeshRenderer.sharedMaterial = combinedMaterial;

            newObject.SetActive(showMeshAtStart);
            
        }
    }
}

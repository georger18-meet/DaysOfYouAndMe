using UnityEngine;

public class JellyEffect : MonoBehaviour
{
    // Public variables for customization
    public float speed = 1.0f;          // Speed of the jelly effect
    public float strength = 0.1f;       // Strength of the jelly effect
    public Vector3 direction = Vector3.up; // Direction of the jelly effect
    public bool startOnAwake = true;    // Whether to start jelly effect on game start

    private MeshFilter meshFilter;
    private SkinnedMeshRenderer skinnedMeshRenderer;
    private Mesh mesh;
    private Vector3[] baseVertices;
    private Vector3[] originalVertices;
    private float time;
    private bool jellyActive = false;

    void Awake()
    {
        // Try to get MeshFilter and SkinnedMeshRenderer components
        meshFilter = GetComponent<MeshFilter>();
        skinnedMeshRenderer = GetComponent<SkinnedMeshRenderer>();

        if (meshFilter != null)
        {
            // Handle static mesh
            mesh = meshFilter.mesh;
        }
        else if (skinnedMeshRenderer != null)
        {
            // Handle skinned mesh
            mesh = skinnedMeshRenderer.sharedMesh;
        }
        else
        {
            Debug.LogError("No MeshFilter or SkinnedMeshRenderer found. Please attach this script to a GameObject with either of these components.");
            return;
        }

        // Save the base vertices for resetting later
        baseVertices = mesh.vertices;
        originalVertices = (Vector3[])baseVertices.Clone();

        // Start jelly effect based on the flag
        if (startOnAwake)
        {
            StartJelly();
        }
    }

    void Update()
    {
        if (!jellyActive || mesh == null) return;

        time += Time.deltaTime * speed; // Increment time based on speed
        Vector3[] vertices = mesh.vertices;

        for (int i = 0; i < vertices.Length; i++)
        {
            Vector3 vertex = baseVertices[i];
            float offset = Mathf.Sin(time + vertex.x * 2.0f) * strength;
            vertices[i] = vertex + direction * offset;
        }

        mesh.vertices = vertices;
        mesh.RecalculateBounds();

        if (skinnedMeshRenderer != null)
        {
            // For skinned mesh, update the sharedMesh
            skinnedMeshRenderer.sharedMesh = mesh;
        }
    }

    // Public methods to start and stop the jelly effect
    public void StartJelly()
    {
        jellyActive = true;
        // Ensure the mesh is reset to its original state
        if (mesh != null)
        {
            mesh.vertices = originalVertices;
            mesh.RecalculateBounds();
        }
    }

    public void StopJelly()
    {
        jellyActive = false;
        // Optionally, you can reset to the original vertices here if needed
    }

    void OnDisable()
    {
        // Ensure mesh is reset to original vertices when disabling or exiting play mode
        if (mesh != null)
        {
            mesh.vertices = originalVertices;
            mesh.RecalculateBounds();
        }
    }
}

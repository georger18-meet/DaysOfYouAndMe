using UnityEngine;
using System.Collections.Generic;

public class FoliageCullingGroup : MonoBehaviour
{
    [Header("Camera")]
    [SerializeField] private Camera targetCamera;

    [Header("Collection")]
    [SerializeField] private LayerMask foliageLayer;
    [SerializeField] private bool autoCollectOnStart = true;

    [Header("Distance")]
    [SerializeField] private float maxRenderDistance = 120f;

    [Header("Debug")]
    [SerializeField] private bool debugLog = true;

    private CullingGroup cullingGroup;

    private BoundingSphere[] spheres;
    private Renderer[] renderers;

    private List<Renderer> rendererList = new List<Renderer>();

    void Start()
    {
        if (targetCamera == null)
            targetCamera = Camera.main;

        if (autoCollectOnStart)
            CollectRenderers();

        SetupCullingGroup();
    }

    void CollectRenderers()
    {
        rendererList.Clear();

        Renderer[] all = FindObjectsOfType<Renderer>();

        foreach (Renderer r in all)
        {
            if (((1 << r.gameObject.layer) & foliageLayer) != 0)
            {
                rendererList.Add(r);
            }
        }

        if (debugLog)
            Debug.Log("Collected foliage renderers: " + rendererList.Count);
    }

    void SetupCullingGroup()
    {
        int count = rendererList.Count;

        spheres = new BoundingSphere[count];
        renderers = new Renderer[count];

        for (int i = 0; i < count; i++)
        {
            Renderer r = rendererList[i];

            renderers[i] = r;

            spheres[i] = new BoundingSphere(
                r.bounds.center,
                Mathf.Max(r.bounds.extents.x,
                          r.bounds.extents.y,
                          r.bounds.extents.z) + 1f
            );

            // Force visible initially
            r.enabled = true;
        }

        cullingGroup = new CullingGroup();

        cullingGroup.targetCamera = targetCamera;

        cullingGroup.SetBoundingSpheres(spheres);

        cullingGroup.SetBoundingSphereCount(count);

        cullingGroup.SetBoundingDistances(new float[] { maxRenderDistance });

        cullingGroup.onStateChanged += OnStateChanged;

        if (debugLog)
            Debug.Log("CullingGroup initialized with " + count + " objects.");
    }

    void OnStateChanged(CullingGroupEvent evt)
    {
        Renderer r = renderers[evt.index];

        if (r == null) return;

        bool shouldRender = evt.currentDistance == 0;

        r.enabled = shouldRender;
    }

    void OnDisable()
    {
        if (cullingGroup != null)
            cullingGroup.Dispose();
    }

    void OnDestroy()
    {
        if (cullingGroup != null)
            cullingGroup.Dispose();
    }
}

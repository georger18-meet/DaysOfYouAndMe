using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using System.Collections;

[RequireComponent(typeof(Camera))]
public class DofFocus : MonoBehaviour
{
    private Camera cameraMain;
    public Volume postProcessingVolume;
    private DepthOfField dof;
    private MinFloatParameter dofDistanceParameter;

    private Ray ray;
    private RaycastHit hit;
    private Vector3 viewportCenter;
    public LayerMask mask;

    public float defaultDistance = 1.75f;
    public float minDistance = 0.4f;
    public float focusSpeed = 10f;
    private float transitionSpeed = 1f; // Speed of transition when starting/stopping auto DOF

    private float targetDistance;
    private float hitDistance;
    private float initialDistance; // Store the initial distance when starting auto DOF
    private Transform thisTransform;

    public bool startAutoDofAtStart = true; // Flag to determine whether to start auto depth of field at the start of the game
    private bool autoDofEnabled = false; // Flag to control auto depth of field

    private void Awake()
    {
        thisTransform = transform;
    }

    private void Start()
    {
        postProcessingVolume.profile.TryGet<DepthOfField>(out dof);
        dofDistanceParameter = dof.focusDistance;
        viewportCenter = new Vector3(0.5f, 0.5f, 0);
        cameraMain = GetComponent<Camera>();
        targetDistance = defaultDistance;

        initialDistance = defaultDistance; // Store the initial distance

        if (startAutoDofAtStart)
        {
            StartAutoDof();
        }
    }

    private void Update()
    {
        if (autoDofEnabled)
        {
            UpdateAutoDof();
        }
    }

    private void UpdateAutoDof()
    {
        ray = cameraMain.ViewportPointToRay(viewportCenter);
        if (Physics.Raycast(ray, out hit, defaultDistance - 0.1f, mask))
        {
            hitDistance = Mathf.Max(hit.distance, minDistance);
        }
        else
        {
            hitDistance = defaultDistance;
        }

        targetDistance = Mathf.Lerp(targetDistance, hitDistance, focusSpeed * Time.deltaTime);
        dofDistanceParameter.value = targetDistance;
    }

    // Method to start auto depth of field focusing
    public void StartAutoDof()
    {
        autoDofEnabled = true;
    }

    // Method to stop auto depth of field focusing
    public void StopAutoDof()
    {
        autoDofEnabled = false;
        // Start a coroutine to smoothly transition to the default distance
        StartCoroutine(TransitionToDefaultDistance());
    }

    private IEnumerator TransitionToDefaultDistance()
    {
        float elapsedTime = 0f;
        float startDistance = targetDistance;
        float endDistance = initialDistance;

        while (elapsedTime < transitionSpeed)
        {
            targetDistance = Mathf.Lerp(startDistance, endDistance, elapsedTime / transitionSpeed);
            dofDistanceParameter.value = targetDistance;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        targetDistance = endDistance;
        dofDistanceParameter.value = targetDistance;
    }
}

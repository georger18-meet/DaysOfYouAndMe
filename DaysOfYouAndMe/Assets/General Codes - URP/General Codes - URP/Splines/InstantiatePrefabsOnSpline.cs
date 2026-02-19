using UnityEngine;

[System.Serializable]
public class MarkerPrefabPair
{
    public Transform marker; // Marker defining the position on the spline
    public GameObject prefab; // Prefab to instantiate at the marker position
    [HideInInspector] public bool instantiated; // Flag to track if prefab is instantiated at this marker
}

public class InstantiatePrefabsOnSpline : MonoBehaviour
{
    public MarkerPrefabPair[] markerPrefabPairs; // List of marker-prefab pairs
    public float speed = 1.0f; // Speed of prefab instantiation
    public bool instantiateAtStart = true; // Flag to determine if instantiation should start at the beginning

    private Vector3[] points;
    private float[] distances; // Distance to each marker along the spline
    private float totalLength;
    private float distanceTraveled;

    private int currentMarkerIndex = 0;
    private bool isInstantiating = false;

    void Start()
    {
        int numMarkers = markerPrefabPairs.Length;
        points = new Vector3[numMarkers];
        distances = new float[numMarkers];

        for (int i = 0; i < numMarkers; i++)
        {
            points[i] = markerPrefabPairs[i].marker.position;
            distances[i] = i == 0 ? 0 : distances[i - 1] + Vector3.Distance(points[i], points[i - 1]);
        }

        totalLength = distances[numMarkers - 1];

        if (instantiateAtStart)
        {
            StartInstantiate();
        }
    }

    void Update()
    {
        // Instantiating prefabs along the spline based on speed
        if (isInstantiating)
        {
            distanceTraveled += speed * Time.deltaTime;

            if (distanceTraveled <= totalLength)
            {
                InstantiatePrefabsAlongSpline();
            }
        }
    }

    void InstantiatePrefabsAlongSpline()
    {
        float distance = distanceTraveled;

        // Ensure distance is within spline length
        distance = Mathf.Clamp(distance, 0, totalLength);

        // Find the next marker to instantiate prefab
        for (int i = currentMarkerIndex; i < markerPrefabPairs.Length; i++)
        {
            if (distance >= distances[i])
            {
                Vector3 spawnPosition = points[i];

                // Instantiate prefab at the calculated position
                Instantiate(markerPrefabPairs[i].prefab, spawnPosition, Quaternion.identity);

                // Move to the next marker
                currentMarkerIndex++;
            }
            else
            {
                // If the distance is less than the distance to the next marker, 
                // break the loop to prevent further unnecessary iterations
                break;
            }
        }

        // Check if the last marker is reached and handle its instantiation
        if (currentMarkerIndex == markerPrefabPairs.Length && !markerPrefabPairs[currentMarkerIndex - 1].instantiated)
        {
            Vector3 spawnPosition = points[currentMarkerIndex - 1];
            Instantiate(markerPrefabPairs[currentMarkerIndex - 1].prefab, spawnPosition, Quaternion.identity);
            markerPrefabPairs[currentMarkerIndex - 1].instantiated = true;
        }
    }

    public void StartInstantiate()
    {
        isInstantiating = true;
    }

    public void StopInstantiate()
    {
        isInstantiating = false;
    }
}

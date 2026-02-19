using UnityEngine;

public class MoveOnSpline : MonoBehaviour
{
    public Transform[] markers; // List of markers defining the spline path
    public GameObject objectToMove; // Object that will move along the spline
    public bool moveAtStart = true; // Whether to start moving the object at the beginning
    public bool loopSpline = false; // Whether the spline should be closed into a loop
    public float speed = 1.0f; // Speed of the moving object    

    private Vector3[] points;
    private float[] distances;
    private float totalLength;
    private float distanceTraveled;
    private bool isMoving;

    void Start()
    {
        InitializeSpline();
        distanceTraveled = 0;
        isMoving = false;

        if (moveAtStart)
            StartMove();
    }

    void Update()
    {
        if (isMoving)
        {
            MoveObjectAlongSpline();
        }
    }

    void InitializeSpline()
    {
        int numMarkers = markers.Length;
        points = new Vector3[numMarkers];
        distances = new float[numMarkers];

        for (int i = 0; i < numMarkers; i++)
        {
            points[i] = markers[i].position;
            distances[i] = i == 0 ? 0 : distances[i - 1] + Vector3.Distance(points[i], points[i - 1]);
        }

        if (loopSpline)
        {
            totalLength = distances[numMarkers - 1] + Vector3.Distance(points[numMarkers - 1], points[0]);
        }
        else
        {
            totalLength = distances[numMarkers - 1];
        }

        if (objectToMove == null)
        {
            Debug.LogWarning("No object assigned to move along the spline.");
        }
    }

    public void StartMove()
    {
        isMoving = true;
    }

    public void StopMove()
    {
        isMoving = false;
    }

    // Public method to change speed during runtime
    public void ChangeSpeed(float newSpeed)
    {
        speed = newSpeed;
    }

    void MoveObjectAlongSpline()
    {
        distanceTraveled += speed * Time.deltaTime;

        if (loopSpline && distanceTraveled >= totalLength)
        {
            distanceTraveled -= totalLength;
        }

        Vector3 newPosition = GetSplinePoint(distanceTraveled);
        objectToMove.transform.position = newPosition;

        // Calculate rotation
        if (distanceTraveled < totalLength)
        {
            Vector3 nextPosition = GetSplinePoint(distanceTraveled + 0.1f); // Slight distance ahead for direction
            objectToMove.transform.rotation = Quaternion.LookRotation(nextPosition - newPosition);
        }
    }

    private Vector3 GetSplinePoint(float distance)
    {
        if (loopSpline)
        {
            distance = Mathf.Repeat(distance, totalLength);
        }
        else
        {
            distance = Mathf.Clamp(distance, 0, totalLength);
        }

        for (int i = 1; i < markers.Length; i++)
        {
            if (distance <= distances[i])
            {
                float t = (distance - distances[i - 1]) / Vector3.Distance(points[i], points[i - 1]);
                return Vector3.Lerp(points[i - 1], points[i], t);
            }
        }

        return loopSpline ? points[0] : points[markers.Length - 1];
    }
}

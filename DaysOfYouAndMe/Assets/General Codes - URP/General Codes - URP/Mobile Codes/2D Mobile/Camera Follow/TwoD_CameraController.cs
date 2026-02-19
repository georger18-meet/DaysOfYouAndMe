using UnityEngine;
using UnityEngine.Events;

public class TwoD_CameraController : MonoBehaviour
{
    public Transform player; 
    public float lowerBoundOffset = 5f; 
    public bool makeCameraScrollUp = false;
    public float cameraScrollSpeed = 0.5f;

    public UnityEvent onPlayerFall; // Event to trigger when player falls


    void Update()
    {
        if (player.position.y > transform.position.y && makeCameraScrollUp == false)
        {
            // Move camera up to follow player
            transform.position = new Vector3(transform.position.x, player.position.y, transform.position.z);
        }

        if (makeCameraScrollUp == true)
        {
            transform.position += Vector3.up * cameraScrollSpeed * Time.deltaTime;
        }

        if (player.position.y < transform.position.y - lowerBoundOffset)
        {
            // Trigger player fall event
            onPlayerFall?.Invoke();
        }        
    }   
}

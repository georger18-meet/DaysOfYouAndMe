using UnityEngine;

public class Sprite_Parallax : MonoBehaviour
{
    private float startPos;
    private Camera _camera;
    public float parallaxSpeed = 0.5f;

    void Start()
    {
        startPos = transform.position.x;
        _camera = Camera.main;     
    }

    void FixedUpdate()
    {
       float distance = _camera.transform.position.x * parallaxSpeed;
       transform.position = new Vector3(startPos + distance, transform.position.y, transform.position.z);
    }
}

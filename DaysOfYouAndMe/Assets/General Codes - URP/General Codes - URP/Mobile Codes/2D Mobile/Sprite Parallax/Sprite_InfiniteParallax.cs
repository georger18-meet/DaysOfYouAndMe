using UnityEngine;

public class Sprite_InfiniteParallax : MonoBehaviour
{
    private float startPos, length;
    private Camera _camera;
    public float parallaxSpeed = 0.5f;

    void Start()
    {
        startPos = transform.position.x;
        length = this.GetComponent<SpriteRenderer>().bounds.size.x;
        _camera = Camera.main;
    }

    void FixedUpdate()
    {
        float distance = _camera.transform.position.x * parallaxSpeed;
        float movement = _camera.transform.position.x * (1 - parallaxSpeed);

        transform.position = new Vector3(startPos + distance, transform.position.y, transform.position.z);

        if (movement > startPos + length)
        {
            startPos += length;
        }
        else if (movement < startPos - length)
        {
            startPos -= length;
        }
    }
}
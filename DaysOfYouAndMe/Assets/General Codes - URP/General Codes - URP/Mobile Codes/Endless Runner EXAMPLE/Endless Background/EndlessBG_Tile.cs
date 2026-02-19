using UnityEngine;

public class EndlessBG_Tile : MonoBehaviour
{
    // Public variable to set the speed of the tile
    public float moveSpeed = 8.0f;
    public float deleteDistance = -10f;

    private void Update()
    {
        // Move the tile backwards
        transform.Translate(Vector3.back * moveSpeed * Time.deltaTime);

        // Check if the tile has moved past a certain point (e.g., z < -10)
        if (transform.position.z < deleteDistance)
        {
            Destroy(gameObject);
        }
    }
}

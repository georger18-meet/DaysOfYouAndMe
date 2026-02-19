using UnityEngine;

public class CollisionParticleSpawner : MonoBehaviour
{
    // Reference to the particle system prefab
    public GameObject particlePrefab;

    // Duration the particle system should exist before being destroyed
    public float particleLifetime = 5.0f;

    // Offset to adjust the position of the instantiated particle system
    public Vector3 offset = new Vector3(0f, 0.1f, 0f);

    // This method is called when the collider attached to this object collides with another collider
    void OnCollisionEnter(Collision collision)
    {
        // Get the contact point of the collision
        ContactPoint contact = collision.GetContact(0);
        Quaternion rot = Quaternion.FromToRotation(Vector3.up, contact.normal);
        Vector3 pos = contact.point;

        // Instantiate the particle system at the collision point with rotation
        ParticleSystem particleInstance = Instantiate(particlePrefab, pos, rot).GetComponent<ParticleSystem>();

        // Adjust position based on the offset
        if (particleInstance != null)
        {
            particleInstance.transform.position += offset;
        }

        // Destroy the particle system after the specified lifetime
        Destroy(particleInstance.gameObject, particleLifetime);
    }
}

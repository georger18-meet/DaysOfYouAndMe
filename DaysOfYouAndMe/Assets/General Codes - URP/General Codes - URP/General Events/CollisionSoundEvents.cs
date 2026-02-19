using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class CollisionSoundEvents : MonoBehaviour
{    
    public int magnitude = 3;
    public LayerMask collisionLayers = Physics.AllLayers;

    public AudioSource audioSource;
    public float minPitch = 0.75f;
    public float maxPitch = 1.25f;
    public float minVolume = 0.75f;
    public float maxVolume = 1.0f;
    
    public UnityEvent CollisionEvent;    

    private void OnCollisionEnter(Collision collision)
    {
        if ((collisionLayers.value & (1 << collision.gameObject.layer)) != 0)
        {
            if (collision.relativeVelocity.magnitude > magnitude && audioSource != null)
            {
                CollisionEvent.Invoke();

                // Randomize pitch and volume
                float randomPitch = Random.Range(minPitch, maxPitch);
                float randomVolume = Random.Range(minVolume, maxVolume);
                audioSource.pitch = randomPitch;
                audioSource.volume = randomVolume;

                // Play the audio
                audioSource.Play();
            }
        }
    }
}

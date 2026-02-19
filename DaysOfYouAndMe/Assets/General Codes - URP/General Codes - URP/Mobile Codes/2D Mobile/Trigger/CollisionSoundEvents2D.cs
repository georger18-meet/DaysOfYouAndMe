using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class CollisionSoundEvents2D : MonoBehaviour
{
    public int magnitude = 3;

    public AudioSource audioSource;
    public float minPitch = 0.5f;
    public float maxPitch = 1.5f;
    public float minVolume = 0.5f;
    public float maxVolume = 1.0f;

    public UnityEvent CollisionEvent;

    private void OnCollisionEnter2D(Collision2D collision)
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

using UnityEngine;
using System.Collections;

public class ContinuousCollisionSound : MonoBehaviour
{
    public AudioSource audioSource; // Public AudioSource variable
    public AudioClip collisionSound; // The sound to play during the collision
    public float minVolume = 0.5f; // Minimum volume of the sound
    public float maxVolume = 1.0f; // Maximum volume of the sound
    public float minPitch = 0.8f; // Minimum pitch of the sound
    public float maxPitch = 1f; // Maximum pitch of the sound
    public float minRelativeVelocity = 0.1f; // Minimum relative velocity to play sound
    public float raycastDistanceMultiplier = 1.0f; // Multiplier for raycast distance relative to collider size
    public LayerMask collisionMask; // Layer mask for objects to detect
    public float fadeDuration = 0.1f; // Duration of the fade-in and fade-out

    private Rigidbody rb;
    private Collider col;
    private float raycastDistance;
    private Vector3 lastPosition;
    private Coroutine fadeCoroutine;
    private bool isPlaying;
    private bool isFading;

    void Start()
    {
        if (audioSource == null)
        {
            Debug.LogError("AudioSource is not assigned.");
            return;
        }

        // Get the Rigidbody component
        rb = GetComponent<Rigidbody>();
        col = GetComponent<Collider>();

        if (col == null)
        {
            Debug.LogError("Collider is not assigned.");
            return;
        }

        // Calculate the raycast distance based on the size of the collider
        raycastDistance = Mathf.Max(col.bounds.extents.x, col.bounds.extents.y, col.bounds.extents.z) * raycastDistanceMultiplier;

        // Initialize the last position
        lastPosition = transform.position;

        // Set initial volume to 0
        audioSource.volume = 0;
    }

    void FixedUpdate()
    {
        // Calculate the velocity of the object based on its position change
        Vector3 currentPosition = transform.position;
        Vector3 velocity = (currentPosition - lastPosition) / Time.fixedDeltaTime;
        lastPosition = currentPosition;

        // Cast rays in all directions to detect nearby colliders
        RaycastHit hit;
        bool isHit = Physics.Raycast(transform.position, transform.forward, out hit, raycastDistance, collisionMask) ||
                     Physics.Raycast(transform.position, -transform.forward, out hit, raycastDistance, collisionMask) ||
                     Physics.Raycast(transform.position, transform.right, out hit, raycastDistance, collisionMask) ||
                     Physics.Raycast(transform.position, -transform.right, out hit, raycastDistance, collisionMask) ||
                     Physics.Raycast(transform.position, transform.up, out hit, raycastDistance, collisionMask) ||
                     Physics.Raycast(transform.position, -transform.up, out hit, raycastDistance, collisionMask);

        if (isHit && hit.collider != null && hit.collider != col) // Ignore self-collision
        {
            // Calculate relative velocity
            Vector3 relativeVelocity = velocity;
            float magnitude = relativeVelocity.magnitude;

            // Play sound if relative velocity is above the threshold
            if (magnitude > minRelativeVelocity)
            {
                if (!isPlaying && !isFading)
                {
                    audioSource.clip = collisionSound;
                    audioSource.loop = true; // Use looping to ensure the sound can fade out properly
                    audioSource.Play();
                    if (fadeCoroutine != null) StopCoroutine(fadeCoroutine);
                    fadeCoroutine = StartCoroutine(FadeIn(audioSource, fadeDuration));
                }
                audioSource.volume = Mathf.Lerp(minVolume, maxVolume, magnitude / minRelativeVelocity);
                audioSource.pitch = Mathf.Lerp(minPitch, maxPitch, magnitude / minRelativeVelocity);
            }
            else
            {
                if (isPlaying && !isFading)
                {
                    if (fadeCoroutine != null) StopCoroutine(fadeCoroutine);
                    fadeCoroutine = StartCoroutine(FadeOut(audioSource, fadeDuration));
                }
            }
        }
        else
        {
            if (isPlaying && !isFading)
            {
                if (fadeCoroutine != null) StopCoroutine(fadeCoroutine);
                fadeCoroutine = StartCoroutine(FadeOut(audioSource, fadeDuration));
            }
        }
    }

    private IEnumerator FadeIn(AudioSource audioSource, float duration)
    {
        isFading = true;
        float startVolume = audioSource.volume;
        float targetVolume = maxVolume;

        float time = 0;
        while (time < duration)
        {
            audioSource.volume = Mathf.Lerp(startVolume, targetVolume, time / duration);
            time += Time.deltaTime;
            yield return null;
        }

        audioSource.volume = targetVolume;
        isPlaying = true;
        isFading = false;
    }

    private IEnumerator FadeOut(AudioSource audioSource, float duration)
    {
        isFading = true;
        float startVolume = audioSource.volume;
        float targetVolume = 0;

        float time = 0;
        while (time < duration)
        {
            audioSource.volume = Mathf.Lerp(startVolume, targetVolume, time / duration);
            time += Time.deltaTime;
            yield return null;
        }

        audioSource.volume = targetVolume;
        audioSource.Stop();
        isPlaying = false;
        isFading = false;
    }
}
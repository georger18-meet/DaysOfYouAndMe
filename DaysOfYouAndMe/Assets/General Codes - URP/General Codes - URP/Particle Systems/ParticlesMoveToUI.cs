using UnityEngine;
using System.Collections;

// CANVAS OF UI ELEMENT MUST BE SCREEN SPACE - CAMERA FOR THIS SCRIPT TO WORK!!!

public class ParticlesMoveToUI : MonoBehaviour
{
    public RectTransform targetUI; // The UI element to move particles to
    public ParticleSystem particlesComponent; // Reference to the Particle System component
    public Transform particleForceField; // Reference to the GameObject with the Particle System Force Field component
    public float delayBeforeForceFieldActivation = 1f; // Delay in seconds before activating the force field

    private bool particlesStarted = false; // Flag to track if particles have been started

    private void Start()
    {
        particleForceField.gameObject.GetComponent<ParticleSystemForceField>().enabled = false;
    }
    public void StartParticlesAndMoveToUI()
    {
        particleForceField.gameObject.GetComponent<ParticleSystemForceField>().enabled = false;

        // Restart the particle system
        particlesComponent.Stop();
        particlesComponent.Clear();
        particlesComponent.Play();        

        // Start a coroutine to activate the force field after a delay
        StartCoroutine(ActivateForceFieldAfterDelay());
    }

    // Coroutine to activate the force field after a delay
    private IEnumerator ActivateForceFieldAfterDelay()
    {
        yield return new WaitForSeconds(delayBeforeForceFieldActivation);

        // Update the position of the particle force field to match the UI element's position
        particleForceField.gameObject.GetComponent<ParticleSystemForceField>().enabled = true;
        particlesStarted = true;
    }

    // Update is called once per frame
    private void Update()
    {
        // Update the position of the particle force field to match the UI element's position continuously
        if (particlesStarted)
        {
            UpdateParticleForceFieldPosition();
        }
    }

    // Update the position of the particle force field to match the UI element's visual position
    private void UpdateParticleForceFieldPosition()
    {
        if (targetUI != null && particleForceField != null)
        {
            // Convert the anchored position of the UI element to screen space
            Vector2 screenPoint = RectTransformUtility.WorldToScreenPoint(Camera.main, targetUI.TransformPoint(targetUI.rect.center));

            // Convert the screen space position to world space using the main camera
            Vector3 worldPosition = Camera.main.ScreenToWorldPoint(new Vector3(screenPoint.x, screenPoint.y, Camera.main.nearClipPlane));

            // Update the position of the GameObject with the Particle System Force Field to match the UI element's visual position
            particleForceField.position = new Vector3(worldPosition.x, worldPosition.y, particleForceField.position.z);
        }        
    }
}

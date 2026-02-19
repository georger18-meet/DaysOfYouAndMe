using UnityEngine;
using UnityEngine.Rendering;

[RequireComponent(typeof(AudioReverbZone))]
[RequireComponent(typeof(Collider))] // Require a Collider for the trigger area
[RequireComponent(typeof(Rigidbody))] // Require a rigidbody that is kinematic
public class ReverbZoneChanger : MonoBehaviour
{
    public string playerTag = "Player"; // User can customize the player tag in the Inspector
    private AudioReverbZone reverbZone;
    private Collider triggerCollider;
    private Rigidbody rb;

    private void Start()
    {
        reverbZone = GetComponent<AudioReverbZone>();
        triggerCollider = GetComponent<Collider>();
        rb = GetComponent<Rigidbody>();
        triggerCollider.isTrigger = true; // Ensure that the Collider is set as a trigger
        reverbZone.enabled = false; // audio reverb zone works only on triggerenter...
        rb.useGravity = false;
        rb.isKinematic = true;
        this.GetComponent <MeshRenderer>().shadowCastingMode = ShadowCastingMode.Off;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(playerTag))
        {            
            reverbZone.enabled = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag(playerTag))
        {            
            reverbZone.enabled = false;
        }
    }   
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet_Physics : MonoBehaviour
{
    public int magnitude = 1;
    public AudioClip _audio;
    GameObject spawnAudioSource;    
    public string animationTriggerName;
    public ParticleSystem smokePrefab;

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.relativeVelocity.magnitude > magnitude)
        {
            this.GetComponent<Rigidbody>().useGravity = true;
            
            if (_audio != null)
            {
                spawnAudioSource = new GameObject("Bullet_Hit_Sound");
                spawnAudioSource.AddComponent<AudioSource>();
                spawnAudioSource.GetComponent<AudioSource>().clip = _audio;
                spawnAudioSource.GetComponent<AudioSource>().Play();
                Destroy(spawnAudioSource, _audio.length);
            }

            if (collision.gameObject.CompareTag("Enemy"))
            {
                collision.gameObject.GetComponent<Animator>().SetTrigger(animationTriggerName);
            }

            ContactPoint contact = collision.GetContact(0);
            Quaternion rot = Quaternion.FromToRotation(Vector3.up, contact.normal);
            Vector3 pos = contact.point;
            ParticleSystem smoke = Instantiate(smokePrefab, pos, rot);
            Instantiate(smoke, pos, rot);
            //Change Particle System's "Stop Action" to Destroy - to have it destroyed when its done playing!

            Destroy(this);
        }
    }
}


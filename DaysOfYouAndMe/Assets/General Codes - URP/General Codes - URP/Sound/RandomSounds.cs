using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// plays a random sound from a list of audio clips (that you add in the Inspector).
// remember - the gameobject this script is placed on, must also have an AudioSource for this to work!

public class RandomSounds : MonoBehaviour
{
    public AudioClip[] audios;
    private int indexer;
    private AudioSource _audioSource;    

    private void Awake()
    {
        _audioSource = this.GetComponent<AudioSource>();        
    }  

    public void PlayRandomSound()
    {
        indexer = Random.Range(0, audios.Length);
        _audioSource.clip = audios[indexer];        
        _audioSource.PlayOneShot(_audioSource.clip);
    }    
}


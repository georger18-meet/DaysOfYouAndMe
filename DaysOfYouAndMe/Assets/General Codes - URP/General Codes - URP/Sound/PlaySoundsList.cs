using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// plays a single sound, from a list of sound clips you created in the Inspector - one after the other (+1).
// remember - the gameobject this script is placed on, must also have an AudioSource for this to work!

public class PlaySoundsList : MonoBehaviour
{
    public AudioClip[] audios;
    private int indexer;
    private AudioSource _audioSource;    

    private void Awake()
    {
        _audioSource = this.GetComponent<AudioSource>();        
    }

    public void PlayNextSound()
    {
        _audioSource.clip = audios[indexer];        
        _audioSource.PlayOneShot(_audioSource.clip);
        indexer += 1;
    }

    private void Update()
    {
        if (indexer >= audios.Length)
        {
            indexer = 0;            
        }       
    }
}


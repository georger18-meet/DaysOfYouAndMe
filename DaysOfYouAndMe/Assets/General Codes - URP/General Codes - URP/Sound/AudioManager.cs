using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour
{ 
    public AudioClip[] UISounds;
    public AudioClip[] SuccessSounds;
    public AudioClip[] Musics;
    public AudioClip[] Atmospheres;
    public AudioClip[] Dialogues;
    private int indexer;
    public AudioSource UISounds_AS;
    public AudioSource SuccessSounds_AS;
    public AudioSource Musics_AS;
    public AudioSource Atmospheres_AS;
    public AudioSource Dialogues_AS;

    private void Awake()
    {
        DontDestroyOnLoad(this.gameObject);
    }

    public void PlayUISounds(int i)
    {
        indexer = i;        
        UISounds_AS.clip = UISounds[indexer];
        UISounds_AS.PlayOneShot(UISounds_AS.clip);        
    }
    public void StopUISounds()
    {
        UISounds_AS.Stop();
    }
    public void PlaySuccessSounds(int i)
    {
        indexer = i;        
        SuccessSounds_AS.clip = SuccessSounds[indexer];
        SuccessSounds_AS.PlayOneShot(SuccessSounds_AS.clip);        
    }
    public void StopSuccessSounds()
    {
        SuccessSounds_AS.Stop();
    }
    public void PlayMusics(int i)
    {
        indexer = i;        
        Musics_AS.clip = Musics[indexer];
        Musics_AS.PlayOneShot(Musics_AS.clip);        
    }
    public void StopMusics()
    {
        Musics_AS.Stop();
    }
    public void PlayAtmospheres(int i)
    {
        indexer = i;        
        Atmospheres_AS.clip = Atmospheres[indexer];
        Atmospheres_AS.PlayOneShot(Atmospheres_AS.clip);        
    }
    public void StopAtmospheres()
    {
        Atmospheres_AS.Stop();
    }
    public void PlayDialogues(int i)
    {
        indexer = i;        
        Dialogues_AS.clip = Dialogues[indexer];
        Dialogues_AS.PlayOneShot(Dialogues_AS.clip);        
    }
    public void StopDialogues()
    {
        Dialogues_AS.Stop();
    }
}

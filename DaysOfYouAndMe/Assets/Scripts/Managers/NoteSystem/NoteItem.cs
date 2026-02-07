using UnityEngine;

public class NoteItem : MonoBehaviour
{
    [Header("Visual")]
    public Sprite noteSprite;
    public Sprite bottomPromptSprite;


    [Header("Audio")]
    public AudioClip openSfx;
    public AudioClip closeSfx;
    public AudioClip narrationAudio; // plays when pressing R
}

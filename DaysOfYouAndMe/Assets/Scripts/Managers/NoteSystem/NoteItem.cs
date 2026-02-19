using UnityEngine;

public class NoteItem : MonoBehaviour
{
    [Header("Journal Info")]
    public string noteTitle = "Untitled Note";

    [Header("Note Content")]
    public Sprite noteSprite;

    [Header("Audio")]
    public AudioClip openSfx;
    public AudioClip closeSfx;
    public AudioClip narrationAudio;

    [Header("UI")]
    public Sprite bottomPromptSprite;
}

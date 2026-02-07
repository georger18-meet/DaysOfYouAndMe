using UnityEngine;
using UnityEngine.UI;

public class NoteUI : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] private GameObject notePanel;
    [SerializeField] private Image noteImage;
    [SerializeField] private BottomPromptUI bottomPromptUI;


    [Header("Audio Sources")]
    [SerializeField] private AudioSource uiAudioSource;       // open/close sounds
    [SerializeField] private AudioSource narrationAudioSource; // narration audio

    private NoteItem currentNote;

    public bool IsOpen { get; private set; }

    void Awake()
    {
        notePanel.SetActive(false);
        IsOpen = false;
    }

    void Update()
    {
        // Press R to play narration
        if (IsOpen && currentNote != null && Input.GetKeyDown(KeyCode.R))
        {
            PlayNarration();
        }
    }

    public void Open(NoteItem note)
    {
        if (note == null) return;

        currentNote = note;

        noteImage.sprite = note.noteSprite;

        // THIS LINE fixes squeezing
        noteImage.SetNativeSize();

        notePanel.SetActive(true);

        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        if (note.openSfx != null && uiAudioSource != null)
            uiAudioSource.PlayOneShot(note.openSfx);

        IsOpen = true;

        if (bottomPromptUI != null && note != null && note.bottomPromptSprite != null)
            bottomPromptUI.Show(note.bottomPromptSprite);
    }


    public void Close()
    {
        if (currentNote != null && currentNote.closeSfx != null && uiAudioSource != null)
        {
            uiAudioSource.PlayOneShot(currentNote.closeSfx);
        }

        notePanel.SetActive(false);

        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;

        IsOpen = false;

        if (bottomPromptUI != null)
            bottomPromptUI.Hide();

        // IMPORTANT: narration continues playing, we do NOT stop it
    }

    void PlayNarration()
    {
        if (currentNote.narrationAudio == null || narrationAudioSource == null)
            return;

        // Do nothing if already playing
        if (narrationAudioSource.isPlaying)
            return;

        narrationAudioSource.clip = currentNote.narrationAudio;
        narrationAudioSource.Play();
    }
}

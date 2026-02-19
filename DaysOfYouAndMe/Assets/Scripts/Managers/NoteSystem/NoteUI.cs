using UnityEngine;
using UnityEngine.UI;

public class NoteUI : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] private GameObject notePanel;
    [SerializeField] private Image noteImage;
    [SerializeField] private BottomPromptUI bottomPromptUI;

    [Header("Audio Sources")]
    [SerializeField] private AudioSource uiAudioSource;        // open/close sounds
    [SerializeField] private AudioSource narrationAudioSource; // narration audio

   
    private NoteItem currentNote;

    // NEW: track which world object should be removed when collected
    private GameObject currentWorldObject;

    public bool IsOpen { get; private set; }

    void Awake()
    {
        if (notePanel != null)
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

        // Optional: allow Esc to close note (if you already handle elsewhere, remove this)
        if (IsOpen && Input.GetKeyDown(KeyCode.Escape))
        {
            Close();
        }
    }

    // Existing signature kept for compatibility
    public void Open(NoteItem note)
    {
        Open(note, note != null ? note.gameObject : null);
    }

    // NEW: pass in the world object so we can remove it after reading
    public void Open(NoteItem note, GameObject sourceWorldObject)
    {
        if (note == null) return;

        currentNote = note;
        currentWorldObject = sourceWorldObject;

        if (noteImage != null)
        {
            noteImage.sprite = note.noteSprite;

            // Fix squeezing
            noteImage.SetNativeSize();
        }

        if (notePanel != null)
            notePanel.SetActive(true);

        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        if (note.openSfx != null && uiAudioSource != null)
            uiAudioSource.PlayOneShot(note.openSfx);

        IsOpen = true;

        if (bottomPromptUI != null && note.bottomPromptSprite != null)
            bottomPromptUI.Show(note.bottomPromptSprite);

        // NOTE: We are NOT collecting/removing on Open by default.
        // We collect on Close so it truly counts as "read".
    }

    public void Close()
    {
        if (!IsOpen) return;

        if (currentNote != null && currentNote.closeSfx != null && uiAudioSource != null)
        {
            uiAudioSource.PlayOneShot(currentNote.closeSfx);
        }

        if (notePanel != null)
            notePanel.SetActive(false);

        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;

        IsOpen = false;

        if (bottomPromptUI != null)
            bottomPromptUI.Hide();

        // IMPORTANT: narration continues playing, we do NOT stop it

     

        // Clear references
        currentNote = null;
        currentWorldObject = null;
    }

   

    void PlayNarration()
    {
        if (currentNote == null) return;
        if (currentNote.narrationAudio == null || narrationAudioSource == null)
            return;

        // Do nothing if already playing
        if (narrationAudioSource.isPlaying)
            return;

        narrationAudioSource.clip = currentNote.narrationAudio;
        narrationAudioSource.Play();
    }
}

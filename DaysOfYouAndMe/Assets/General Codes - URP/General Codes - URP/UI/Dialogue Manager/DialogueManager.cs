using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.Events;

[System.Serializable]
public class DialogueCase
{
    public string header;
    public string[] dialogueLines;
    public AudioClip[] dialogueAudioClips;
    public UnityEvent onStartEvent;
    public UnityEvent onEndEvent;
}

public class DialogueManager : MonoBehaviour
{
    public TextMeshProUGUI dialogueText;
    public KeyCode nextKey = KeyCode.Space; // Key to move forward in dialogue
    public float typingSpeed = 0.05f; // Speed at which text is typed out

    public UnityEvent onStartDialogueGlobalEvent; // Unity event to trigger dialogue start
    public UnityEvent onEndDialogueGlobalEvent; // Unity event to trigger dialogue end

    public List<DialogueCase> dialogueCases; // List of dialogue cases to be added in the Inspector

    private DialogueCase currentCase;
    private int currentLineIndex = 0;
    private bool isTyping = false;
    private bool dialogueStarted = false;
    private string currentLine = "";

    private AudioSource audioSource;
    private Coroutine typingCoroutine;

    private void Start()
    {
        audioSource = GetComponent<AudioSource>();
    }

    public void StartDialogue(string caseHeader)
    {
        DialogueCase selectedCase = dialogueCases.Find(c => c.header == caseHeader);
        if (selectedCase == null)
        {
            Debug.LogError($"Dialogue case with header '{caseHeader}' not found!");
            return;
        }

        if (dialogueStarted)
        {
            CancelDialogue();
        }

        currentCase = selectedCase;
        onStartDialogueGlobalEvent.Invoke();
        currentCase.onStartEvent.Invoke(); // Invoke start event for this specific case
        dialogueStarted = true;
        currentLineIndex = 0;
        ShowNextLine();
    }

    private void CancelDialogue()
    {
        if (typingCoroutine != null)
        {
            StopCoroutine(typingCoroutine);
        }

        dialogueText.text = "";
        currentLineIndex = 0;
        isTyping = false;
        dialogueStarted = false;
        if (audioSource != null && audioSource.isPlaying)
        {
            audioSource.Stop();
        }
        onEndDialogueGlobalEvent.Invoke();
        if (currentCase != null)
        {
            currentCase.onEndEvent.Invoke(); // Invoke end event for the current case
        }
    }

    public void EndDialogue()
    {
        if (typingCoroutine != null)
        {
            StopCoroutine(typingCoroutine);
        }

        dialogueText.text = "";
        currentLineIndex = 0;
        isTyping = false;
        dialogueStarted = false;
        if (audioSource != null && audioSource.isPlaying)
        {
            audioSource.Stop();
        }
        onEndDialogueGlobalEvent.Invoke();
        if (currentCase != null)
        {
            currentCase.onEndEvent.Invoke(); // Invoke end event for the current case
        }
    }

    private void ShowNextLine()
    {
        if (currentLineIndex < currentCase.dialogueLines.Length)
        {
            currentLine = currentCase.dialogueLines[currentLineIndex];
            typingCoroutine = StartCoroutine(TypeOutDialogue());
            if (currentCase.dialogueAudioClips != null && currentCase.dialogueAudioClips.Length > currentLineIndex && dialogueStarted)
            {
                PlayDialogueAudio(currentLineIndex);
            }
            currentLineIndex++;
        }
        else
        {
            EndDialogue();
        }
    }

    private IEnumerator TypeOutDialogue()
    {
        isTyping = true;
        dialogueText.text = "";

        foreach (char letter in currentLine)
        {
            dialogueText.text += letter;
            yield return new WaitForSeconds(typingSpeed);
        }

        isTyping = false;
    }

    private void PlayDialogueAudio(int index)
    {
        if (audioSource != null && currentCase.dialogueAudioClips[index] != null)
        {
            audioSource.clip = currentCase.dialogueAudioClips[index];
            audioSource.Play();
        }
    }

    private void Update()
    {
        if (dialogueStarted && !isTyping && Input.GetKeyDown(nextKey))
        {
            ShowNextLine();
        }
    }

    public void NextLine()
    {
        if (dialogueStarted && !isTyping)
        {
            ShowNextLine();
        }
    }
}

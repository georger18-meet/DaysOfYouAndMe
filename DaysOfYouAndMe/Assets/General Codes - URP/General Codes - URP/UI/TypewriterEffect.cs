using System.Collections;
using UnityEngine;
using TMPro;

public class TypewriterEffect : MonoBehaviour
{
    [SerializeField]
    private TextMeshProUGUI textMeshPro;
    public float typingSpeed = 0.05f;
    public bool startTypingAtStart = true; // Public boolean variable

    private string fullText;
    private string currentText = "";

    private Coroutine typingCoroutine; // Reference to the running coroutine

    private void Start()
    {
        fullText = textMeshPro.text;
        textMeshPro.text = ""; // Clear the text initially

        if (startTypingAtStart)
        {
            StartTyping(); // Start typing if enabled at start
        }
    }

    private IEnumerator TypeOutText(string targetText)
    {
        foreach (char letter in targetText)
        {
            currentText += letter;
            textMeshPro.text = currentText;
            yield return new WaitForSeconds(typingSpeed);
        }
        typingCoroutine = null; // Reset the coroutine reference after completion
    }

    public void StartTyping()
    {
        if (typingCoroutine == null)
        {
            currentText = ""; // Reset the current text
            typingCoroutine = StartCoroutine(TypeOutText(fullText)); // Pass the full text to the coroutine
        }
    }

    public void StopTyping()
    {
        if (typingCoroutine != null)
        {
            StopCoroutine(typingCoroutine);
            typingCoroutine = null;
        }
    }
}

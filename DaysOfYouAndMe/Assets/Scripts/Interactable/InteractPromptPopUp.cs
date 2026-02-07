using UnityEngine;
using TMPro;

public class InteractPromptPopUp : MonoBehaviour
{
    [Header("Prompt Prefab")]
    [SerializeField] private GameObject promptPrefab;

    [Header("Text (optional)")]
    [SerializeField] private string promptText = "E";
    [SerializeField] private Vector3 worldOffset = new Vector3(0f, 0.3f, 0f);

    [Header("Distance")]
    [SerializeField] private float showDistance = 2.5f;

    [Header("Fade")]
    [SerializeField] private float fadeSpeed = 10f; // higher = faster fade

    [Header("Billboard")]
    [SerializeField] private bool faceCamera = true;

    [Header("Optional Locks")]
    [SerializeField] private NoteUI noteUI;
    [SerializeField] private ExamineManager examineManager;

    private Transform cam;
    private GameObject promptInstance;
    private TMP_Text tmp;
    private CanvasGroup canvasGroup;

    private float targetAlpha = 0f;

    void Start()
    {
        cam = Camera.main != null ? Camera.main.transform : null;

        if (promptPrefab != null)
        {
            promptInstance = Instantiate(promptPrefab);
            promptInstance.SetActive(true); // keep active so we can fade smoothly

            tmp = promptInstance.GetComponentInChildren<TMP_Text>();
            if (tmp != null) tmp.text = promptText;

            canvasGroup = promptInstance.GetComponentInChildren<CanvasGroup>();
            if (canvasGroup != null)
                canvasGroup.alpha = 0f; // start hidden
        }
    }

    void Update()
    {
        if (promptInstance == null || cam == null) return;

        // Hide prompt while note is open / examining (optional)
        bool lockedByNote = (noteUI != null && noteUI.IsOpen);
        bool lockedByExamine = (examineManager != null && examineManager.IsExamining());
        if (lockedByNote || lockedByExamine)
        {
            targetAlpha = 0f;
            Fade();
            return;
        }

        float dist = Vector3.Distance(cam.position, transform.position);
        bool shouldShow = dist <= showDistance;

        // Set target alpha
        targetAlpha = shouldShow ? 1f : 0f;

        // Position prompt
        promptInstance.transform.position = transform.position + worldOffset;

        // Face camera
        if (faceCamera)
        {
            Vector3 lookDir = promptInstance.transform.position - cam.position;
            promptInstance.transform.rotation = Quaternion.LookRotation(lookDir);
        }

        Fade();
    }

    private void Fade()
    {
        if (canvasGroup == null) return;

        canvasGroup.alpha = Mathf.MoveTowards(
            canvasGroup.alpha,
            targetAlpha,
            fadeSpeed * Time.deltaTime
        );
    }

    void OnDestroy()
    {
        if (promptInstance != null)
            Destroy(promptInstance);
    }

    // Optional: change prompt text per-object
    public void SetPromptText(string text)
    {
        promptText = text;
        if (tmp != null) tmp.text = promptText;
    }
}

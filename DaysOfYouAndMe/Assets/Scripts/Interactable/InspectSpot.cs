using UnityEngine;

public class InspectSpot : MonoBehaviour
{
    public enum InteractInputType { Key, MouseButton }

    [Header("Interaction")]
    [SerializeField] private InteractInputType inputType = InteractInputType.Key;
    [SerializeField] private KeyCode interactKey = KeyCode.E;
    [SerializeField] private int mouseButton = 0; // 0=LMB, 1=RMB, 2=MMB
    [SerializeField] private KeyCode exitKey = KeyCode.Escape;

    [Header("Proximity")]
    [Tooltip("If true, interaction only works when player is inside this object's trigger.")]
    [SerializeField] private bool requireTriggerProximity = true;

    [Header("Cameras")]
    [Tooltip("Child inspect camera. Recommended: disable its GAMEOBJECT by default in the prefab.")]
    [SerializeField] private Camera inspectCamera;
    [Tooltip("If empty, uses Camera.main at runtime.")]
    [SerializeField] private Camera playerCamera;

    [Header("Auto-Wire (drag objects, not scripts)")]
    [SerializeField] private GameObject playerRoot; // optional
    [SerializeField] private Camera cameraRoot;     // optional

    [Header("Disable While Inspecting (visual hide)")]
    [Tooltip("Any GameObjects you want hidden during inspect (player model, etc.). Re-enabled on exit.")]
    [SerializeField] private GameObject[] disableObjectsWhileInspecting;

    [Header("Disable Components While Inspecting (on THIS inspect object)")]
    [Tooltip("Drag components from this Inspect object to disable while inspecting (optional).")]
    [SerializeField] private Behaviour[] disableComponentsWhileInspecting;

    [Tooltip("Optional: also force-hide these objects (usually the prompt visual) when inspect starts.")]
    [SerializeField] private GameObject[] forceHideWhileInspecting;

    [Header("Prompt Suppression (recommended for InteractPromptPopUp)")]
    [Tooltip("Drag InteractPromptPopUp component(s) here so we can force-hide spawned prompt instances during inspect.")]
    [SerializeField] private InteractPromptPopUp[] suppressPrompts;

    [Header("Audio (optional)")]
    [SerializeField] private AudioSource voiceSource;
    [SerializeField] private AudioClip voiceLine;
    [SerializeField] private bool playVoiceOnce = true;

    private bool _playerInRange;
    private bool _isInspecting;
    private bool _voicePlayed;

    private PlayerController _playerController;
    private CAMController _camController;
    private HeadBob _headBob;

    private AudioListener _playerListener;
    private AudioListener _inspectListener;

    private void Awake()
    {
        if (inspectCamera == null)
            inspectCamera = GetComponentInChildren<Camera>(true);

        if (playerCamera == null)
            playerCamera = Camera.main;

        if (cameraRoot == null)
            cameraRoot = playerCamera;

        if (playerRoot == null)
        {
            GameObject taggedPlayer = GameObject.FindGameObjectWithTag("Player");
            if (taggedPlayer != null)
                playerRoot = taggedPlayer;
        }

        if (playerRoot != null)
            _playerController = playerRoot.GetComponent<PlayerController>();

        if (cameraRoot != null)
        {
            _camController = cameraRoot.GetComponent<CAMController>();
            _headBob = cameraRoot.GetComponent<HeadBob>();
        }

        if (playerCamera != null) _playerListener = playerCamera.GetComponent<AudioListener>();
        if (inspectCamera != null) _inspectListener = inspectCamera.GetComponent<AudioListener>();

        // Key fix: disable the whole inspect camera GAMEOBJECT by default
        if (inspectCamera != null)
            inspectCamera.gameObject.SetActive(false);
    }

    private void Update()
    {
        if (requireTriggerProximity && !_playerInRange)
            return;

        if (_isInspecting)
        {
            if (Input.GetKeyDown(exitKey))
                ExitInspect();
            return;
        }

        if (PressedInteract())
            EnterInspect();
    }

    private bool PressedInteract()
    {
        return inputType == InteractInputType.Key
            ? Input.GetKeyDown(interactKey)
            : Input.GetMouseButtonDown(mouseButton);
    }

    private void EnterInspect()
    {
        if (inspectCamera == null || playerCamera == null)
            return;

        _isInspecting = true;

        // Suppress InteractPromptPopUp prompt instances (fixes "prompt stays visible")
        SetPromptsSuppressed(true);

        // Disable prompt scripts/components on this object so they can't run during inspect (optional)
        SetComponentsEnabled(false);

        // Force-hide any prompt visuals immediately (optional)
        SetForceHideObjectsActive(false);

        // Hide other objects (player visuals etc.)
        SetDisableObjectsActive(false);

        // Switch off player camera + listener
        playerCamera.enabled = false;
        if (_playerListener != null) _playerListener.enabled = false;

        // Switch ON inspect camera object
        inspectCamera.gameObject.SetActive(true);
        if (_inspectListener != null) _inspectListener.enabled = true;

        // Disable your scripts (hard lock)
        if (_playerController != null) _playerController.enabled = false;
        if (_camController != null) _camController.enabled = false;
        if (_headBob != null) _headBob.enabled = false;

        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;

        TryPlayVoiceOnce();
    }

    private void ExitInspect()
    {
        if (!_isInspecting) return;
        _isInspecting = false;

        // Turn off inspect camera object
        if (inspectCamera != null)
            inspectCamera.gameObject.SetActive(false);

        if (_inspectListener != null)
            _inspectListener.enabled = false;

        // Turn on player camera + listener
        if (playerCamera != null)
            playerCamera.enabled = true;

        if (_playerListener != null)
            _playerListener.enabled = true;

        // Re-enable your scripts
        if (_playerController != null) _playerController.enabled = true;
        if (_camController != null) _camController.enabled = true;
        if (_headBob != null) _headBob.enabled = true;

        // Re-enable visuals
        SetDisableObjectsActive(true);

        // Re-enable prompt components/scripts on this object
        SetComponentsEnabled(true);

        // Allow prompt visuals to appear again
        SetForceHideObjectsActive(true);

        // Unsuppress prompt instances
        SetPromptsSuppressed(false);

        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;

        // Do not stop voiceSource; it keeps playing
    }

    private void SetDisableObjectsActive(bool active)
    {
        if (disableObjectsWhileInspecting == null) return;

        for (int i = 0; i < disableObjectsWhileInspecting.Length; i++)
        {
            GameObject go = disableObjectsWhileInspecting[i];
            if (go == null) continue;

            // don't disable the inspect object itself
            if (go == this.gameObject) continue;

            go.SetActive(active);
        }
    }

    private void SetComponentsEnabled(bool enabled)
    {
        if (disableComponentsWhileInspecting == null) return;

        for (int i = 0; i < disableComponentsWhileInspecting.Length; i++)
        {
            Behaviour b = disableComponentsWhileInspecting[i];
            if (b == null) continue;

            // Avoid disabling THIS script
            if (b == this) continue;

            b.enabled = enabled;
        }
    }

    private void SetForceHideObjectsActive(bool active)
    {
        if (forceHideWhileInspecting == null) return;

        for (int i = 0; i < forceHideWhileInspecting.Length; i++)
        {
            GameObject go = forceHideWhileInspecting[i];
            if (go == null) continue;

            go.SetActive(active);
        }
    }

    private void SetPromptsSuppressed(bool suppressed)
    {
        if (suppressPrompts == null) return;

        for (int i = 0; i < suppressPrompts.Length; i++)
        {
            InteractPromptPopUp p = suppressPrompts[i];
            if (p == null) continue;

            p.SetSuppressed(suppressed);
        }
    }

    private void TryPlayVoiceOnce()
    {
        if (voiceSource == null || voiceLine == null) return;

        if (playVoiceOnce && _voicePlayed) return;
        if (voiceSource.isPlaying) return;

        if (playVoiceOnce) _voicePlayed = true;

        voiceSource.clip = voiceLine;
        voiceSource.Play();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
            _playerInRange = true;
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            _playerInRange = false;
            if (_isInspecting) ExitInspect();
        }
    }
}

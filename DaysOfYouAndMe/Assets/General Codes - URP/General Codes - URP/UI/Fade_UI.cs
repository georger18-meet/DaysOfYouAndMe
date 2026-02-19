using UnityEngine;

[RequireComponent(typeof(CanvasGroup))]
public class Fade_UI : MonoBehaviour
{
    private CanvasGroup canvas;

    public float fadeInSpeed = 0.75f;
    public float fadeOutSpeed = 0.75f;

    private float currentAlpha;
    public float desiredAlphaFadeIn = 1f;
    public float desiredAlphaFadeOut = 0f;
    private float cachedDesiredAlphaFadeIn;
    private float cachedDesiredAlphaFadeOut;

    private bool isFadingIn = false;
    private bool isFadingOut = false;

    public bool fadeAtStart = false;
    public bool useUnscaledTime = false;
    public bool affectChildren = true; 

    void Awake()
    {
        canvas = GetComponent<CanvasGroup>();
        currentAlpha = canvas.alpha;
        cachedDesiredAlphaFadeIn = desiredAlphaFadeIn;
        cachedDesiredAlphaFadeOut = desiredAlphaFadeOut;
    }

    void Start()
    {
        if (fadeAtStart)
        {
            StartFadeOut();
            if (affectChildren)
            {
                foreach (Transform child in transform)
                {
                    child.gameObject.SetActive(true);
                }
            }
        }
    }

    private void SetChildrenActive(bool active)
    {
        if (affectChildren)
        {
            foreach (Transform child in transform)
            {
                child.gameObject.SetActive(active);
            }
        }
    }

    void Update()
    {
        float deltaTime = useUnscaledTime ? Time.unscaledDeltaTime : Time.deltaTime;

        if (isFadingIn)
        {
            SetChildrenActive(true);

            currentAlpha = Mathf.MoveTowards(currentAlpha, cachedDesiredAlphaFadeIn, fadeInSpeed * deltaTime);
            canvas.alpha = currentAlpha;

            if (Mathf.Approximately(currentAlpha, cachedDesiredAlphaFadeIn))
            {
                isFadingIn = false;
            }
        }

        if (isFadingOut)
        {
            currentAlpha = Mathf.MoveTowards(currentAlpha, cachedDesiredAlphaFadeOut, fadeOutSpeed * deltaTime);
            canvas.alpha = currentAlpha;

            if (Mathf.Approximately(currentAlpha, cachedDesiredAlphaFadeOut))
            {
                isFadingOut = false;
                SetChildrenActive(false);
            }
        }
    }

    public void StartFadeIn()
    {
        isFadingIn = true;
        isFadingOut = false;
    }

    public void StartFadeOut()
    {
        isFadingOut = true;
        isFadingIn = false;
    }

    void Reset()
    {
        if (canvas == null)
        {
            canvas = GetComponent<CanvasGroup>();
        }        
    }
}

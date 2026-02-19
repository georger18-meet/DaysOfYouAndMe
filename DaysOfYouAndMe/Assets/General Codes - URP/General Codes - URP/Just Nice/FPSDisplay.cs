using UnityEngine;
using TMPro;

public class FPSDisplay : MonoBehaviour
{
    public TextMeshProUGUI text; // Change the data type to TextMeshProUGUI
    public bool show = true;

    private const int targetFPS =
#if UNITY_ANDROID // GEARVR
        60;
#else
        75;
#endif
    private const float updateInterval = 0.5f;

    private int framesCount;
    private float framesTime;

    void Start()
    {
        // no text object set? see if our game object has one to use
        if (text == null)
        {
            text = GetComponent<TextMeshProUGUI>(); // Change GetComponent<TextMeshProUGUI>()
        }
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.F))
        {
            show = !show;
        }

        // monitoring frame counter and the total time
        framesCount++;
        framesTime += Time.unscaledDeltaTime;

        // measuring interval ended, so calculate FPS and display on TextMeshProUGUI
        if (framesTime > updateInterval)
        {
            if (text != null)
            {
                if (show)
                {
                    float fps = framesCount / framesTime;
                    text.text = string.Format("{0:F2} FPS", fps); // Use string.Format for TextMeshProUGUI
                    text.color = (fps > (targetFPS - 5) ? Color.green :
                                 (fps > (targetFPS - 30) ? Color.yellow :
                                  Color.red));
                }
                else
                {
                    text.text = "";
                }
            }
            // reset for the next interval to measure
            framesCount = 0;
            framesTime = 0;
        }
    }
}

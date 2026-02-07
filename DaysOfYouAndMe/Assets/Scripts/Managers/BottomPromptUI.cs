using UnityEngine;
using UnityEngine.UI;

public class BottomPromptUI : MonoBehaviour
{
    [SerializeField] private Image promptImage;

    public void Show(Sprite sprite)
    {
        if (sprite == null) return;

        promptImage.sprite = sprite;
        promptImage.SetNativeSize();
        promptImage.gameObject.SetActive(true);
    }

    public void Hide()
    {
        promptImage.gameObject.SetActive(false);
    }
}

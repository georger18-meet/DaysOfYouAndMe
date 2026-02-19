using UnityEngine;

public class AnimatorFloatSetter : MonoBehaviour
{
    [SerializeField]
    private Animator targetAnimator;

    public string parameterName; // Publicly settable parameter name

    private void Awake()
    {
        if (targetAnimator == null)
        {
            targetAnimator = GetComponent<Animator>();
        }
    }

    public void SetFloat(float value)
    {
        if (targetAnimator != null)
        {
            targetAnimator.SetFloat(parameterName, value);
        }
        else
        {
            Debug.LogWarning("Target Animator is not set on AnimatorFloatSetter component.");
        }
    }
}

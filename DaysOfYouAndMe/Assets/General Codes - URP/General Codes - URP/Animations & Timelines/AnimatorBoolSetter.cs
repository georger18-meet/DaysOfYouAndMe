using UnityEngine;
using UnityEngine.Events;

public class AnimatorBoolSetter : MonoBehaviour
{
    [SerializeField]
    private Animator targetAnimator;

    private void Awake()
    {
        if (targetAnimator == null)
        {
            targetAnimator = GetComponent<Animator>();
        }
    }

    public void SetBoolTrue(string parameterName)
    {
        SetBool(parameterName, true);
    }

    public void SetBoolFalse(string parameterName)
    {
        SetBool(parameterName, false);
    }

    private void SetBool(string parameterName, bool value)
    {
        if (targetAnimator != null)
        {
            targetAnimator.SetBool(parameterName, value);
        }
        else
        {
            Debug.LogWarning("Target Animator is not set on AnimatorBoolSetter component.");
        }
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DissolveGroup : MonoBehaviour
{
    [Header("Find targets")]
    [SerializeField] private bool autoCollectRenderers = true;
    [SerializeField] private List<Renderer> renderers = new List<Renderer>();

    [Header("Advanced Dissolve Property")]
    [Tooltip("Float property name that controls dissolve clip (1=invisible, 0=visible).")]
    [SerializeField] private string clipProperty = "_AdvancedDissolveCutoutStandardClip";

    [Header("Clip Values")]
    [SerializeField] private float clipInvisible = 1f;
    [SerializeField] private float clipVisible = 0f;

    [Header("Animation")]
    [SerializeField] private float duration = 0.6f;
    [SerializeField] private AnimationCurve curve;

    [Header("Behavior")]
    [SerializeField] private bool startInvisible = true;
    [SerializeField] private bool oneTimeOnly = true;

    private readonly List<Material> _mats = new List<Material>();
    private Coroutine _co;
    private bool _revealed;

    public bool HasRevealed => _revealed;

    void Awake()
    {
        if (curve == null || curve.length == 0)
            curve = AnimationCurve.EaseInOut(0, 0, 1, 1);

        CollectMaterials();

        if (startInvisible)
            SetClipAll(clipInvisible);
        else
            SetClipAll(clipVisible);
    }

    private void CollectMaterials()
    {
        if (autoCollectRenderers)
        {
            renderers.Clear();
            renderers.AddRange(GetComponentsInChildren<Renderer>(true));
        }

        _mats.Clear();

        foreach (var r in renderers)
        {
            if (r == null) continue;

            // material(s) creates instances -> safe for per-object control
            var mats = r.materials;
            foreach (var m in mats)
            {
                if (m != null && m.HasProperty(clipProperty))
                    _mats.Add(m);
            }
        }

        if (_mats.Count == 0)
        {
            Debug.LogWarning($"[DissolveGroup:{name}] No materials found with property '{clipProperty}'. " +
                             $"Check the property name or that Advanced Dissolve is enabled on these materials.");
        }
    }

    public void Reveal()
    {
        if (oneTimeOnly && _revealed) return;
        if (_mats.Count == 0) return;
        if (_co != null) return; // don't restart while animating

        _co = StartCoroutine(Animate(clipInvisible, clipVisible));
        _revealed = true;
    }

    public void Hide()
    {
        if (_mats.Count == 0) return;
        if (_co != null) return;

        _co = StartCoroutine(Animate(clipVisible, clipInvisible));
        _revealed = false;
    }

    public void ResetToInvisible()
    {
        if (_co != null) StopCoroutine(_co);
        _co = null;
        _revealed = false;
        SetClipAll(clipInvisible);
    }

    private IEnumerator Animate(float from, float to)
    {
        float t = 0f;

        while (t < duration)
        {
            t += Time.deltaTime;
            float a = Mathf.Clamp01(t / duration);
            float eased = curve.Evaluate(a);

            float v = Mathf.Lerp(from, to, eased);
            SetClipAll(v);

            yield return null;
        }

        SetClipAll(to);
        _co = null;
    }

    private void SetClipAll(float value)
    {
        for (int i = 0; i < _mats.Count; i++)
        {
            var m = _mats[i];
            if (m == null) continue;
            m.SetFloat(clipProperty, value);
        }
    }
}

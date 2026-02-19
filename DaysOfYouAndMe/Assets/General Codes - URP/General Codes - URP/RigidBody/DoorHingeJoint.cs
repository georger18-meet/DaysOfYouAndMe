using UnityEngine;

#if UNITY_EDITOR
using UnityEditor;
#endif

public class DoorHingeJoint : MonoBehaviour
{
    public enum HingePosition
    {
        Right,
        Left,
        Middle
    }

    public HingePosition hingePosition = HingePosition.Right;
    public Vector3 axis = Vector3.up; // Default axis for a door is usually the Y-axis

    private void OnValidate()
    {
        SetupHingeJoint();
    }

    private void Start()
    {
        StartCoroutine(DelayedSetup());
    }

    private System.Collections.IEnumerator DelayedSetup()
    {
        // Wait for a short delay before setting up the hinge joint
        yield return new WaitForSeconds(0.1f);

        SetupHingeJoint();
    }

    public void SetupHingeJoint()
    {
        HingeJoint hingeJoint = GetComponent<HingeJoint>();
        if (hingeJoint == null)
        {
            hingeJoint = gameObject.AddComponent<HingeJoint>(); // Add HingeJoint if not already present
        }

        hingeJoint.axis = axis;

        Renderer renderer = GetComponent<Renderer>();
        if (renderer == null)
        {
            Debug.LogError("No Renderer component found on the GameObject.");
            return;
        }

        Bounds bounds = renderer.bounds;
        Vector3 anchor = Vector3.zero;

        switch (hingePosition)
        {
            case HingePosition.Right:
                anchor = bounds.max - Vector3.right * bounds.size.x * 0.5f;
                break;
            case HingePosition.Left:
                anchor = bounds.min + Vector3.right * bounds.size.x * 0.5f;
                break;
            case HingePosition.Middle:
                anchor = bounds.center;
                break;
        }

        // Convert the anchor to local space
        hingeJoint.anchor = transform.InverseTransformPoint(anchor);
    }
}

#if UNITY_EDITOR
[CustomEditor(typeof(DoorHingeJoint))]
public class DoorHingeJointEditor : Editor
{
    public override void OnInspectorGUI()
    {
        DrawDefaultInspector();

        DoorHingeJoint doorHingeJoint = (DoorHingeJoint)target;

        if (GUILayout.Button("Setup Hinge Joint"))
        {
            doorHingeJoint.SetupHingeJoint();
        }
    }
}
#endif

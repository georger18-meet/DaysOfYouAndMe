using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;

public class NotesGizmo : MonoBehaviour
{
    public string UserNameChoice;
    public Color UserColorChoice = new Color(0, 0, 0, 1);
    public GUIStyle myStyle = new GUIStyle();

#if UNITY_EDITOR
    void OnDrawGizmos()
    {
        Gizmos.color = UserColorChoice;
        Gizmos.DrawSphere(transform.position, 0.15f);
        UnityEditor.Handles.Label(transform.position + Vector3.up * 0.3f, UserNameChoice, myStyle);
    }
    void OnDrawGizmosSelected()
    {
        Gizmos.color = UserColorChoice;
        Gizmos.DrawSphere(transform.position, 0.2f);
    }
#endif
}

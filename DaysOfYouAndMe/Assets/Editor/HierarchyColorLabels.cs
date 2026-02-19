#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;
using System.Collections.Generic;

[InitializeOnLoad]
public static class HierarchyColorLabels
{
    // Change these colors however you like
    private static readonly Dictionary<string, Color> Palette = new()
    {
        { "Red",    new Color(1f, 0.35f, 0.35f, 0.35f) },
        { "Green",  new Color(0.35f, 1f, 0.35f, 0.35f) },
        { "Blue",   new Color(0.35f, 0.6f, 1f, 0.35f) },
        { "Yellow", new Color(1f, 0.9f, 0.35f, 0.35f) },
        { "Purple", new Color(0.8f, 0.45f, 1f, 0.35f) },
        { "Cyan",   new Color(0.35f, 1f, 1f, 0.30f) },
        { "Gray",   new Color(0.7f, 0.7f, 0.7f, 0.25f) },
    };

    static HierarchyColorLabels()
    {
        EditorApplication.hierarchyWindowItemOnGUI += OnHierarchyGUI;
    }

    private static void OnHierarchyGUI(int instanceID, Rect selectionRect)
    {
        var obj = EditorUtility.InstanceIDToObject(instanceID) as GameObject;
        if (obj == null) return;

        string key = GetKey(obj);
        string label = EditorPrefs.GetString(key, string.Empty);
        if (string.IsNullOrEmpty(label)) return;

        if (!Palette.TryGetValue(label, out var color)) return;

        // Draw behind the object name
        EditorGUI.DrawRect(selectionRect, color);
    }

    private static string GetKey(GameObject go)
    {
        // Stable-ish key: scene path + object path
        // (If you rename/move objects, the key changes — which is usually fine for "labels".)
        string scenePath = go.scene.path;
        string objPath = GetTransformPath(go.transform);
        return $"HierarchyColorLabel::{scenePath}::{objPath}";
    }

    private static string GetTransformPath(Transform t)
    {
        var path = t.name;
        while (t.parent != null)
        {
            t = t.parent;
            path = t.name + "/" + path;
        }
        return path;
    }

    // -------- Context Menu (right-click in Hierarchy) --------

    [MenuItem("GameObject/Color Label/Red", false, 0)]
    private static void SetRed() => SetForSelection("Red");

    [MenuItem("GameObject/Color Label/Green", false, 0)]
    private static void SetGreen() => SetForSelection("Green");

    [MenuItem("GameObject/Color Label/Blue", false, 0)]
    private static void SetBlue() => SetForSelection("Blue");

    [MenuItem("GameObject/Color Label/Yellow", false, 0)]
    private static void SetYellow() => SetForSelection("Yellow");

    [MenuItem("GameObject/Color Label/Purple", false, 0)]
    private static void SetPurple() => SetForSelection("Purple");

    [MenuItem("GameObject/Color Label/Cyan", false, 0)]
    private static void SetCyan() => SetForSelection("Cyan");

    [MenuItem("GameObject/Color Label/Gray", false, 0)]
    private static void SetGray() => SetForSelection("Gray");

    [MenuItem("GameObject/Color Label/Clear", false, 50)]
    private static void Clear() => SetForSelection(string.Empty);

    private static void SetForSelection(string label)
    {
        foreach (var go in Selection.gameObjects)
        {
            if (go == null) continue;
            string key = GetKey(go);

            if (string.IsNullOrEmpty(label))
                EditorPrefs.DeleteKey(key);
            else
                EditorPrefs.SetString(key, label);
        }

        EditorApplication.RepaintHierarchyWindow();
    }
}
#endif

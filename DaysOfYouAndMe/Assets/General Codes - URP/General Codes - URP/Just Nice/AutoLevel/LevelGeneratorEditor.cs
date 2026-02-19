#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(LevelGenerator))]
public class LevelGeneratorEditor : Editor
{
    private LevelGenerator levelGenerator;

    private void OnEnable()
    {
        levelGenerator = (LevelGenerator)target;
        if (levelGenerator.grid == null || levelGenerator.grid.Length == 0)
        {
            levelGenerator.grid = new string[levelGenerator.width, levelGenerator.height];
            levelGenerator.InitializeGrid();
        }
    }

    public override void OnInspectorGUI()
    {
        DrawDefaultInspector();

        if (GUILayout.Button("Generate Level"))
        {
            levelGenerator.GenerateLevel();
        }

        GUILayout.Space(10);
        GUILayout.Label("Paint Grid", EditorStyles.boldLabel);

        for (int y = 0; y < levelGenerator.height; y++)
        {
            GUILayout.BeginHorizontal();
            for (int x = 0; x < levelGenerator.width; x++)
            {
                string label = levelGenerator.grid[x, y];

                if (GUILayout.Button(label, GUILayout.Width(30), GUILayout.Height(30)))
                {
                    label = NextGridValue(label); // Toggle between 'G', 'W1', 'W2', ''
                    levelGenerator.grid[x, y] = label;
                    EditorUtility.SetDirty(levelGenerator);
                }
            }
            GUILayout.EndHorizontal();
        }

        GUILayout.Space(10);
        if (GUILayout.Button("Clear Grid"))
        {
            for (int x = 0; x < levelGenerator.width; x++)
            {
                for (int y = 0; y < levelGenerator.height; y++)
                {
                    levelGenerator.grid[x, y] = "G";
                }
            }
            EditorUtility.SetDirty(levelGenerator);
        }

        GUILayout.Space(10);
        if (GUILayout.Button("Delete All Objects"))
        {
            DeleteAllChildren();
        }
    }

    string NextGridValue(string currentValue)
    {
        switch (currentValue)
        {
            case "G":
                return "W1";
            case "W1":
                return "W2";
            case "W2":
                return "";
            case "":
                return "G";
            default:
                return "G";
        }
    }

    void DeleteAllChildren()
    {
        int childCount = levelGenerator.transform.childCount;
        for (int i = childCount - 1; i >= 0; i--)
        {
            DestroyImmediate(levelGenerator.transform.GetChild(i).gameObject);
        }
    }
}
#endif
using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using System.Linq;

// Place this script in your regular Assets folder, NOT in Editor folder
public class GridBuilder : MonoBehaviour
{
    public float gridSize = 1f;
    public Color gridColor = new Color(0.2f, 0.8f, 0.2f, 0.7f);
    public float gridHeightOffset = 0.01f;
    public float levelHeight = 3f;
    public float stairHeight = 0.5f; // Default stair placement height
    public bool showGrid = true;
    public int currentLevel = 0;
}

#if UNITY_EDITOR
[CustomEditor(typeof(GridBuilder))]
public class GridBuilderEditor : Editor
{
    private GridBuilder grid;
    private GameObject activeObject;
    private GameObject previewObject;
    private Vector3 currentRotation = Vector3.zero;

    // For stair height adjustment
    private float currentStairHeight = 0f;

    // Categories
    private Dictionary<string, List<GameObject>> prefabs = new Dictionary<string, List<GameObject>>()
    {
        { "Floors", new List<GameObject>() },
        { "Walls", new List<GameObject>() },
        { "Ceilings", new List<GameObject>() },
        { "Stairs", new List<GameObject>() },
        { "Furniture / Props", new List<GameObject>() }
    };
    private string currentCategory = "Floors";

    private void OnEnable()
    {
        grid = (GridBuilder)target;
        SceneView.duringSceneGui += DuringSceneGui;
        LoadPrefabs();
        currentStairHeight = 0;
    }

    private void OnDisable()
    {
        SceneView.duringSceneGui -= DuringSceneGui;
        if (previewObject != null)
        {
            DestroyImmediate(previewObject);
        }
        SavePrefabs();
    }

    // Save prefabs to EditorPrefs
    private void SavePrefabs()
    {
        foreach (var category in prefabs.Keys)
        {
            // Build a list of GUIDs for the prefabs
            string guidList = "";
            foreach (var prefab in prefabs[category])
            {
                if (prefab != null)
                {
                    string prefabPath = AssetDatabase.GetAssetPath(prefab);
                    string guid = AssetDatabase.AssetPathToGUID(prefabPath);
                    guidList += guid + ",";
                }
            }

            // Store the GUIDs in EditorPrefs
            EditorPrefs.SetString("GridBuilder_" + grid.GetInstanceID() + "_" + category, guidList);
        }
    }

    // Load prefabs from EditorPrefs
    private void LoadPrefabs()
    {
        foreach (var category in prefabs.Keys.ToArray())
        {
            string key = "GridBuilder_" + grid.GetInstanceID() + "_" + category;
            string guidList = EditorPrefs.GetString(key, "");

            if (!string.IsNullOrEmpty(guidList))
            {
                string[] guids = guidList.Split(new char[] { ',' }, System.StringSplitOptions.RemoveEmptyEntries);

                foreach (string guid in guids)
                {
                    string path = AssetDatabase.GUIDToAssetPath(guid);
                    GameObject prefab = AssetDatabase.LoadAssetAtPath<GameObject>(path);
                    if (prefab != null && !prefabs[category].Contains(prefab))
                    {
                        prefabs[category].Add(prefab);
                    }
                }
            }
        }
    }

    public override void OnInspectorGUI()
    {
        EditorGUILayout.LabelField("Grid Builder", EditorStyles.boldLabel);

        // Grid settings
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Grid Settings", EditorStyles.boldLabel);
        grid.gridSize = EditorGUILayout.FloatField("Grid Size", grid.gridSize);
        grid.gridColor = EditorGUILayout.ColorField("Grid Color", grid.gridColor);
        grid.showGrid = EditorGUILayout.Toggle("Show Grid", grid.showGrid);
        grid.levelHeight = EditorGUILayout.FloatField("Level Height", grid.levelHeight);
        grid.stairHeight = EditorGUILayout.FloatField("Stair Step Height", grid.stairHeight);

        // Level controls
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Building Level", EditorStyles.boldLabel);
        EditorGUILayout.BeginHorizontal();
        if (GUILayout.Button("Level Down"))
        {
            grid.currentLevel = Mathf.Max(0, grid.currentLevel - 1);
            SceneView.RepaintAll();
        }
        EditorGUILayout.LabelField($"Level {grid.currentLevel}");
        if (GUILayout.Button("Level Up"))
        {
            grid.currentLevel++;
            SceneView.RepaintAll();
        }
        EditorGUILayout.EndHorizontal();

        // Categories
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Prefab Categories", EditorStyles.boldLabel);
        EditorGUILayout.BeginHorizontal();
        foreach (string category in prefabs.Keys)
        {
            if (GUILayout.Button(category, category == currentCategory ? EditorStyles.toolbarButton : EditorStyles.miniButton))
            {
                currentCategory = category;
                // Reset stair height when switching categories
                currentStairHeight = 0;
            }
        }
        EditorGUILayout.EndHorizontal();

        // Drop area
        EditorGUILayout.Space();
        EditorGUILayout.HelpBox($"Drag {currentCategory} prefabs here:", MessageType.None);
        Rect dropArea = GUILayoutUtility.GetRect(0, 50, GUILayout.ExpandWidth(true));
        GUI.Box(dropArea, "Drop Prefabs Here");

        // Handle drag and drop
        Event evt = Event.current;
        switch (evt.type)
        {
            case EventType.DragUpdated:
            case EventType.DragPerform:
                if (!dropArea.Contains(evt.mousePosition))
                    break;

                DragAndDrop.visualMode = DragAndDropVisualMode.Copy;

                if (evt.type == EventType.DragPerform)
                {
                    DragAndDrop.AcceptDrag();

                    foreach (Object obj in DragAndDrop.objectReferences)
                    {
                        GameObject prefab = obj as GameObject;
                        if (prefab != null && PrefabUtility.IsPartOfAnyPrefab(prefab))
                        {
                            prefabs[currentCategory].Add(prefab);
                        }
                    }
                }
                evt.Use();
                break;
        }

        // Display prefabs
        EditorGUILayout.Space();
        List<GameObject> categoryPrefabs = prefabs[currentCategory];

        if (categoryPrefabs.Count == 0)
        {
            EditorGUILayout.HelpBox("No prefabs added yet.", MessageType.Info);
        }
        else
        {
            EditorGUILayout.BeginHorizontal();
            int cols = 3;

            for (int i = 0; i < categoryPrefabs.Count; i++)
            {
                if (i > 0 && i % cols == 0)
                {
                    EditorGUILayout.EndHorizontal();
                    EditorGUILayout.BeginHorizontal();
                }

                EditorGUILayout.BeginVertical(GUILayout.Width(70));

                Texture2D preview = AssetPreview.GetAssetPreview(categoryPrefabs[i]);
                if (GUILayout.Button(preview, GUILayout.Width(64), GUILayout.Height(64)))
                {
                    SelectPrefab(categoryPrefabs[i]);
                }

                GUILayout.Label(categoryPrefabs[i].name, EditorStyles.miniLabel);

                if (GUILayout.Button("X", GUILayout.Width(20)))
                {
                    categoryPrefabs.RemoveAt(i--);
                }

                EditorGUILayout.EndVertical();
            }

            EditorGUILayout.EndHorizontal();
        }

        // Active prefab
        if (activeObject != null)
        {
            EditorGUILayout.Space();
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField($"Placing: {activeObject.name}");

            if (GUILayout.Button("Cancel"))
            {
                if (previewObject != null)
                {
                    DestroyImmediate(previewObject);
                    previewObject = null;
                }
                activeObject = null;
                currentStairHeight = 0;
            }

            EditorGUILayout.EndHorizontal();

            // Rotation and height controls
            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Placement Controls:", EditorStyles.boldLabel);

            // Rotation buttons
            EditorGUILayout.BeginHorizontal();
            if (GUILayout.Button("Y - Rotate Left"))
            {
                RotatePreview(0, -90, 0);
            }
            if (GUILayout.Button("U - Rotate Up"))
            {
                RotatePreview(-90, 0, 0);
            }
            if (GUILayout.Button("I - Rotate Right"))
            {
                RotatePreview(0, 90, 0);
            }
            EditorGUILayout.EndHorizontal();

            // Add stair height controls if in Stairs category
            if (currentCategory == "Stairs")
            {
                EditorGUILayout.Space();
                EditorGUILayout.LabelField("Stair Height:", EditorStyles.boldLabel);
                EditorGUILayout.BeginHorizontal();

                if (GUILayout.Button("↓ Lower", GUILayout.Width(80)))
                {
                    currentStairHeight = Mathf.Max(0, currentStairHeight - grid.stairHeight);
                    SceneView.RepaintAll();
                }

                EditorGUILayout.LabelField($"Height: {currentStairHeight:F2}", GUILayout.Width(80));

                if (GUILayout.Button("↑ Raise", GUILayout.Width(80)))
                {
                    currentStairHeight += grid.stairHeight;
                    SceneView.RepaintAll();
                }

                EditorGUILayout.EndHorizontal();
            }

            EditorGUILayout.HelpBox(
                "Keyboard Shortcuts:\n" +
                "Y: Rotate Left\n" +
                "U: Rotate Up\n" +
                "I: Rotate Right\n" +
                "ESC: Cancel placement",
                MessageType.Info);
        }
    }

    private void SelectPrefab(GameObject prefab)
    {
        activeObject = prefab;
        currentStairHeight = 0; // Reset stair height

        if (previewObject != null)
        {
            DestroyImmediate(previewObject);
        }

        previewObject = (GameObject)PrefabUtility.InstantiatePrefab(prefab);
        currentRotation = Vector3.zero;
        previewObject.transform.rotation = Quaternion.Euler(currentRotation);

        // Make it transparent
        MakeTransparent(previewObject, 0.5f);

        SceneView.lastActiveSceneView.Focus();
    }

    private void MakeTransparent(GameObject obj, float alpha)
    {
        foreach (Renderer renderer in obj.GetComponentsInChildren<Renderer>())
        {
            Material[] originalMaterials = renderer.sharedMaterials;
            Material[] transparentMaterials = new Material[originalMaterials.Length];

            for (int i = 0; i < originalMaterials.Length; i++)
            {
                transparentMaterials[i] = new Material(originalMaterials[i]);
                Color color = transparentMaterials[i].color;
                color.a = alpha;
                transparentMaterials[i].color = color;

                transparentMaterials[i].SetFloat("_Mode", 3); // Transparent
                transparentMaterials[i].SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
                transparentMaterials[i].SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                transparentMaterials[i].SetInt("_ZWrite", 0);
                transparentMaterials[i].DisableKeyword("_ALPHATEST_ON");
                transparentMaterials[i].EnableKeyword("_ALPHABLEND_ON");
                transparentMaterials[i].DisableKeyword("_ALPHAPREMULTIPLY_ON");
                transparentMaterials[i].renderQueue = 3000;
            }

            renderer.materials = transparentMaterials;
        }
    }

    private void RotatePreview(float x, float y, float z)
    {
        if (previewObject == null) return;

        currentRotation += new Vector3(x, y, z);
        previewObject.transform.rotation = Quaternion.Euler(currentRotation);
        SceneView.RepaintAll();
    }

    private void DuringSceneGui(SceneView sceneView)
    {
        // Draw grid
        if (grid.showGrid)
        {
            DrawGrid();
        }

        // Handle keyboard input
        HandleKeyboardInput();

        // Handle object placement
        if (activeObject != null && previewObject != null)
        {
            HandlePlacement();
        }
    }

    private void HandleKeyboardInput()
    {
        Event e = Event.current;

        if (e.type == EventType.KeyDown && previewObject != null)
        {
            bool usedKey = true;

            switch (e.keyCode)
            {
                case KeyCode.Y:
                    RotatePreview(0, -90, 0);
                    break;
                case KeyCode.I:
                    RotatePreview(0, 90, 0);
                    break;
                case KeyCode.U:
                    RotatePreview(-90, 0, 0);
                    break;
                case KeyCode.Escape:
                    if (previewObject != null)
                    {
                        DestroyImmediate(previewObject);
                        previewObject = null;
                    }
                    activeObject = null;
                    currentStairHeight = 0;
                    break;
                default:
                    usedKey = false;
                    break;
            }

            if (usedKey)
            {
                e.Use();
            }
        }
    }

    private void DrawGrid()
    {
        if (SceneView.lastActiveSceneView == null || SceneView.lastActiveSceneView.camera == null)
            return;

        Camera camera = SceneView.lastActiveSceneView.camera;
        Vector3 cameraPos = camera.transform.position;

        // Calculate grid center
        Vector3 gridCenter = new Vector3(
            Mathf.Floor(cameraPos.x / grid.gridSize) * grid.gridSize,
            grid.currentLevel * grid.levelHeight,
            Mathf.Floor(cameraPos.z / grid.gridSize) * grid.gridSize
        );

        // Set grid color
        Handles.color = grid.gridColor;

        // Draw grid lines
        int extent = 10;
        float size = grid.gridSize;

        for (int i = -extent; i <= extent; i++)
        {
            // X lines
            Handles.DrawLine(
                gridCenter + new Vector3(i * size, grid.gridHeightOffset, -extent * size),
                gridCenter + new Vector3(i * size, grid.gridHeightOffset, extent * size)
            );

            // Z lines
            Handles.DrawLine(
                gridCenter + new Vector3(-extent * size, grid.gridHeightOffset, i * size),
                gridCenter + new Vector3(extent * size, grid.gridHeightOffset, i * size)
            );
        }
    }

    private void HandlePlacement()
    {
        Event e = Event.current;
        Ray ray = HandleUtility.GUIPointToWorldRay(e.mousePosition);

        // Try to hit something or use plane at current level
        Vector3 position = GetPlacementPosition(ray, out bool validPosition);

        if (validPosition)
        {
            // Set the height based on category
            if (currentCategory == "Ceilings")
            {
                position.y = (grid.currentLevel + 1) * grid.levelHeight - 0.05f;
            }
            else if (currentCategory == "Stairs")
            {
                // Use current stair height for stairs
                position.y = grid.currentLevel * grid.levelHeight + currentStairHeight;
            }
            else
            {
                position.y = grid.currentLevel * grid.levelHeight;
            }

            // Update preview position
            previewObject.transform.position = position;

            // Draw highlighted cell
            DrawHighlightedCell(position);

            // Handle mouse click to place object
            if (e.type == EventType.MouseDown && e.button == 0)
            {
                // Instantiate the object
                GameObject placedObject = (GameObject)PrefabUtility.InstantiatePrefab(activeObject);

                // Apply small offsets to prevent z-fighting
                Vector3 finalPosition = position;

                if (currentCategory == "Floors")
                {
                    finalPosition.y += 0.001f;
                }
                else if (currentCategory == "Walls")
                {
                    finalPosition.y += 0.002f;
                }
                else if (currentCategory == "Stairs")
                {
                    finalPosition.y += 0.003f;
                }
                else if (currentCategory == "Furniture / Props")
                {
                    finalPosition.y += 0.004f;
                }

                // Set position and rotation
                placedObject.transform.position = finalPosition;
                placedObject.transform.rotation = previewObject.transform.rotation;

                // Register undo
                Undo.RegisterCreatedObjectUndo(placedObject, "Place Object");

                e.Use();
            }
        }
    }

    private Vector3 GetPlacementPosition(Ray ray, out bool validPosition)
    {
        validPosition = false;
        Vector3 position = Vector3.zero;

        // Try to hit something with raycast
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit))
        {
            position = SnapToGrid(hit.point);
            validPosition = true;
        }
        else
        {
            // If raycast fails, use a plane at the current level
            Plane horizontalPlane = new Plane(Vector3.up, new Vector3(0, grid.currentLevel * grid.levelHeight, 0));
            float distance;

            if (horizontalPlane.Raycast(ray, out distance))
            {
                position = SnapToGrid(ray.GetPoint(distance));
                validPosition = true;
            }
        }

        return position;
    }

    private Vector3 SnapToGrid(Vector3 position)
    {
        return new Vector3(
            Mathf.Round(position.x / grid.gridSize) * grid.gridSize,
            position.y,
            Mathf.Round(position.z / grid.gridSize) * grid.gridSize
        );
    }

    private void DrawHighlightedCell(Vector3 position)
    {
        if (!grid.showGrid) return;

        Handles.color = new Color(grid.gridColor.r, grid.gridColor.g, grid.gridColor.b, 0.5f);

        float halfSize = grid.gridSize * 0.5f;
        Vector3[] corners = new Vector3[4];
        corners[0] = position + new Vector3(-halfSize, 0, -halfSize);
        corners[1] = position + new Vector3(halfSize, 0, -halfSize);
        corners[2] = position + new Vector3(halfSize, 0, halfSize);
        corners[3] = position + new Vector3(-halfSize, 0, halfSize);

        Handles.DrawSolidRectangleWithOutline(corners, Handles.color, Handles.color);
    }
}

[InitializeOnLoad]
public class GridBuilderMenu
{
    static GridBuilderMenu()
    {
        // Constructor for InitializeOnLoad
    }

    [MenuItem("Tools/Grid Builder/Create Grid")]
    public static void CreateGrid()
    {
        GridBuilder existing = GameObject.FindAnyObjectByType<GridBuilder>();
        if (existing != null)
        {
            Selection.activeGameObject = existing.gameObject;
            return;
        }

        GameObject gridObject = new GameObject("Grid Builder");
        gridObject.AddComponent<GridBuilder>();
        Selection.activeGameObject = gridObject;
    }
}
#endif
using UnityEngine;

public class LevelGenerator : MonoBehaviour
{
    public int width = 10;
    public int height = 10;
    public GameObject groundTile;
    public GameObject wallTile1; // Wall for up & down edges
    public GameObject wallTile2; // Wall for left & right edges

    private GameObject emptyTilePrefab; // Prefab for empty tile

    public string[,] grid;

    private void Start()
    {
        if (grid == null || grid.Length == 0)
        {
            grid = new string[width, height];
            InitializeGrid();
        }

        // Create an empty GameObject prefab if not assigned
        if (emptyTilePrefab == null)
        {
            emptyTilePrefab = new GameObject("EmptyTile");
        }

        GenerateLevel();
    }

    public void GenerateLevel()
    {
        // Clear previous tiles
        ClearLevel();

        // Instantiate tiles based on the grid
        for (int x = 0; x < width; x++)
        {
            for (int y = 0; y < height; y++)
            {
                if (grid[x, y] == "G")
                {
                    InstantiateTile(groundTile, new Vector3(x, 0, y), Quaternion.identity);
                }
                else if (grid[x, y] == "W1")
                {
                    InstantiateTile(wallTile2, new Vector3(x, 0, y), Quaternion.Euler(0f, 90f, 90f)); // Wall for up & down edges (90 degrees on z-axis)
                }
                else if (grid[x, y] == "W2")
                {
                    InstantiateTile(wallTile1, new Vector3(x, 0, y), Quaternion.Euler(0f, 0f, 90f)); // Wall for left & right edges (90 degrees on z-axis)
                }
                else if (grid[x, y] == "")
                {
                    // Instantiate empty GameObject if prefab is still null (fallback)
                    if (emptyTilePrefab == null)
                    {
                        emptyTilePrefab = new GameObject("EmptyTile");
                    }

                    InstantiateTile(emptyTilePrefab, new Vector3(x, 0, y), Quaternion.identity);
                }
            }
        }
    }

    public void InitializeGrid()
    {
        // Initialize grid with ground tiles and walls
        for (int x = 0; x < width; x++)
        {
            for (int y = 0; y < height; y++)
            {
                if (x == 0 || x == width - 1)
                {
                    grid[x, y] = "W2"; // W2 for left & right edges (swapped with W1)
                }
                else if (y == 0 || y == height - 1)
                {
                    grid[x, y] = "W1"; // W1 for up & down edges (swapped with W2)
                }
                else
                {
                    grid[x, y] = "G"; // G for ground
                }
            }
        }
    }

    void InstantiateTile(GameObject prefab, Vector3 position, Quaternion rotation)
    {
        GameObject tile = Instantiate(prefab, position, rotation, transform);
        tile.transform.localScale = prefab.transform.localScale;
    }

    void ClearLevel()
    {
#if UNITY_EDITOR
        // Destroy all child objects in edit mode
        while (transform.childCount > 0)
        {
            DestroyImmediate(transform.GetChild(0).gameObject);
        }
#else
        // Destroy all child objects in play mode
        foreach (Transform child in transform)
        {
            Destroy(child.gameObject);
        }
#endif
    }
}

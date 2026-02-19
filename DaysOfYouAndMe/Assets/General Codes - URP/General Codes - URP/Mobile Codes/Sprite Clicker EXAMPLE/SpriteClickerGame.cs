using UnityEngine;
using System.Collections.Generic;
using UnityEngine.EventSystems;
using System.Linq;

public class SpriteClickerGame : MonoBehaviour
{
    [System.Serializable]
    public class SpriteInfo
    {
        public GameObject spritePrefab;
    }

    public List<SpriteInfo> spriteInfoList = new List<SpriteInfo>();
    public List<Transform> spawnLocations = new List<Transform>();
    public float initialSpawnInterval = 2f;
    public float minSpawnInterval = 1f;
    public float spawnIntervalDecreaseRate = 0.01f;
    public int initialMaxActiveSprites = 5;
    public int maxActiveSpritesIncreaseInterval = 30; // seconds
    public bool startGameAtStart = true;
    public float locationCooldownTime = 2f;
    public List<Sprite> backgroundSprites;
    public SpriteRenderer backgroundSpriteRenderer;

    private Dictionary<Transform, GameObject> activeSpritesAtLocations = new Dictionary<Transform, GameObject>();
    private Dictionary<Transform, float> locationCooldowns = new Dictionary<Transform, float>();
    private float currentSpawnInterval;
    private float spawnTimer;
    private int currentMaxActiveSprites;
    private float gameTimer;
    private bool isGameRunning = false;

    private void Start()
    {
        InitializeGame();
        if (startGameAtStart)
        {
            StartGame();
        }
    }

    private void InitializeGame()
    {
        currentSpawnInterval = initialSpawnInterval;
        currentMaxActiveSprites = initialMaxActiveSprites;

        foreach (Transform location in spawnLocations)
        {
            locationCooldowns[location] = 0f;
        }
    }

    private void Update()
    {
        if (!isGameRunning) return;

        gameTimer += Time.deltaTime;
        spawnTimer += Time.deltaTime;

        UpdateCooldowns();
        TrySpawnSprite();
        UpdateDifficulty();
        CheckForPlayerInput();
        UpdateBackgroundSprite();
    }

    private void UpdateCooldowns()
    {
        var locationKeys = new List<Transform>(locationCooldowns.Keys);
        foreach (var location in locationKeys)
        {
            if (locationCooldowns[location] > 0)
            {
                locationCooldowns[location] -= Time.deltaTime;
            }
        }
    }

    private void TrySpawnSprite()
    {
        if (spawnTimer >= currentSpawnInterval && activeSpritesAtLocations.Count < currentMaxActiveSprites)
        {
            SpawnRandomSprite();
            spawnTimer = 0f;
        }
    }

    private void UpdateDifficulty()
    {
        currentSpawnInterval = Mathf.Max(minSpawnInterval, initialSpawnInterval - (gameTimer * spawnIntervalDecreaseRate));
        currentMaxActiveSprites = initialMaxActiveSprites + (int)(gameTimer / maxActiveSpritesIncreaseInterval);
    }

    private void CheckForPlayerInput()
    {
        if (Input.GetMouseButtonDown(0) || (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began))
        {
            Vector2 clickPosition = Input.mousePosition;
            if (Input.touchCount > 0)
            {
                clickPosition = Input.GetTouch(0).position;
            }

            CheckSpriteClick(clickPosition);
        }
    }

    private void SpawnRandomSprite()
    {
        if (spriteInfoList.Count == 0 || spawnLocations.Count == 0) return;

        List<Transform> availableLocations = new List<Transform>();
        foreach (Transform location in spawnLocations)
        {
            if (!activeSpritesAtLocations.ContainsKey(location) && locationCooldowns[location] <= 0)
            {
                availableLocations.Add(location);
            }
        }

        if (availableLocations.Count == 0) return;

        int randomLocationIndex = Random.Range(0, availableLocations.Count);
        Transform randomLocation = availableLocations[randomLocationIndex];

        int randomSpriteIndex = Random.Range(0, spriteInfoList.Count);
        SpriteInfo randomSpriteInfo = spriteInfoList[randomSpriteIndex];

        GameObject newSprite = Instantiate(randomSpriteInfo.spritePrefab, randomLocation.position, Quaternion.identity);
        activeSpritesAtLocations[randomLocation] = newSprite;
    }

    private void CheckSpriteClick(Vector2 clickPosition)
    {
        Ray ray = Camera.main.ScreenPointToRay(clickPosition);
        RaycastHit2D hit = Physics2D.Raycast(ray.origin, ray.direction);

        if (hit.collider != null)
        {
            GameObject clickedObject = hit.collider.gameObject;
            Transform locationKey = null;

            foreach (var kvp in activeSpritesAtLocations)
            {
                if (kvp.Value == clickedObject)
                {
                    locationKey = kvp.Key;
                    break;
                }
            }

            if (locationKey != null)
            {
                activeSpritesAtLocations.Remove(locationKey);
                Destroy(clickedObject);
                locationCooldowns[locationKey] = locationCooldownTime;
            }
        }
    }

    private void UpdateBackgroundSprite()
    {
        if (backgroundSprites.Count == 0 || backgroundSpriteRenderer == null) return;

        float progress = (float)activeSpritesAtLocations.Count / currentMaxActiveSprites;
        int spriteIndex = Mathf.Clamp(Mathf.FloorToInt(progress * (backgroundSprites.Count - 1)), 0, backgroundSprites.Count - 1);
        backgroundSpriteRenderer.sprite = backgroundSprites[spriteIndex];
    }

    public void StartGame()
    {
        isGameRunning = true;
        gameTimer = 0f;
        spawnTimer = 0f;
        InitializeGame();
        ClearActiveSprites();
    }

    public void StopGame()
    {
        isGameRunning = false;
        ClearActiveSprites();

        // Reset background sprite to the first one
        if (backgroundSprites.Count > 0 && backgroundSpriteRenderer != null)
        {
            backgroundSpriteRenderer.sprite = backgroundSprites[0];
        }
    }

    private void ClearActiveSprites()
    {
        foreach (var sprite in activeSpritesAtLocations.Values)
        {
            Destroy(sprite);
        }
        activeSpritesAtLocations.Clear();
        foreach (var location in locationCooldowns.Keys.ToList())
        {
            locationCooldowns[location] = 0f;
        }
    }
}

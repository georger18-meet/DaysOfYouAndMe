using UnityEngine;
using System.Collections;

public class ScaleToFillScreen_Sprite_Renderer : MonoBehaviour
{
    private SpriteRenderer sr;
    private Transform _transform;
    public int pixelsToUnityUnits = 10;
    public Camera cam;
    

    // Use this for initialization
    void Start()
    {
        _transform = transform;
        sr = GetComponent<SpriteRenderer>();
        cam = (cam != null) ? cam : Camera.main;
    }

    // Update is called once per frame
    void Update()
    {

        Sprite sprite = sr.sprite;
        float aspectRatio = Screen.width / (float)Screen.height; // in respect to width

        // Guesstimation
        int orthoPixelsY = Mathf.CeilToInt(cam.orthographicSize * 2 * pixelsToUnityUnits);
        int orthoPixelsX = Mathf.CeilToInt(orthoPixelsY * aspectRatio);

        // orthoX and orthoY are obviously not the same as the screen resolution, but we can take advantage of the fact that they're scaled based
        // on unity units and ignore calculating based on screen pixels

        // find the ratio in scales along each respective axis' and assign as the new local scale
        Vector3 newScale = new Vector3(orthoPixelsX / (float)sprite.rect.width, orthoPixelsY / (float)sprite.rect.height, 1f);
        _transform.localScale = newScale;

     
    }
}
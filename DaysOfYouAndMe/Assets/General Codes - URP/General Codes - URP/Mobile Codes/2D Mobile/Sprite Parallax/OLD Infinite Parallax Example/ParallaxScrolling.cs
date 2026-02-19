using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(RawImage))]

public class ParallaxScrolling : MonoBehaviour
{
    public bool moveAtStartToLeft = false;
    public bool moveAtStartToRight = false;
    public bool allowTouchMove = true;
    public float scrollSpeed = 1500f;
    public float resetThreshold = 10.0f;
    public float touchThreshold = 0.5f;

    private bool isDragging = false;
    private bool touchDown = false;
    private Vector2 lastPosition;
    private Vector2 startTouchPosition;

    private RawImage backgroundRawImage;
    private float textureWidth;
    private bool canMove = true;

    private bool continiousLeft = false;
    private bool continiousRight = false;

    void Start()
    {
        backgroundRawImage = GetComponent<RawImage>();
        textureWidth = GetTextureWidth();

        if (moveAtStartToLeft)
            ContiniousLeftMove();
        if (moveAtStartToRight)
            ContiniousRightMove();

        if (!moveAtStartToLeft || !moveAtStartToRight)
            canMove = true;
        else
            canMove = false;
    }

    void Update()
    {
        if (canMove)
        {
            if (allowTouchMove) // Check if touch movement is allowed
            {
                // Detect swipe gestures
                if (Input.GetMouseButtonDown(0))
                {
                    startTouchPosition = Input.mousePosition;
                    touchDown = true;
                    isDragging = true;
                }

                if (Input.GetMouseButtonUp(0))
                {
                    touchDown = false;
                    isDragging = false;
                }

                if (isDragging)
                {
                    Vector2 delta = (Vector2)Input.mousePosition - lastPosition;

                    if (delta.x > touchThreshold)
                        MoveRight();
                    else if (delta.x < -touchThreshold)
                        MoveLeft();

                    lastPosition = Input.mousePosition;
                }

                // Handle touch input
                if (Input.touchCount > 0)
                {
                    Touch touch = Input.GetTouch(0);

                    if (touch.phase == TouchPhase.Began)
                    {
                        startTouchPosition = touch.position;
                        lastPosition = touch.position;
                        touchDown = true;
                        isDragging = true;
                    }
                    else if (touch.phase == TouchPhase.Moved)
                    {
                        Vector2 delta = touch.position - lastPosition;

                        if (delta.x > touchThreshold)
                            MoveRight();
                        else if (delta.x < -touchThreshold)
                            MoveLeft();

                        lastPosition = touch.position;
                    }
                    else if (touch.phase == TouchPhase.Ended || touch.phase == TouchPhase.Canceled)
                    {
                        touchDown = false;
                        isDragging = false;
                    }
                }
            }
        }
    }

    void FixedUpdate()
    {
        // Continuous movement to the right if user touched screen, swiped, and kept the touch down
        if (touchDown && !isDragging)
            MoveLeft();

        if (continiousLeft)
            MoveLeft();

        if (continiousRight)
            MoveRight();
    }

    private void MoveRight()
    {
        Rect uvRect = backgroundRawImage.uvRect;
        uvRect.x += Time.deltaTime * scrollSpeed / textureWidth;
        backgroundRawImage.uvRect = uvRect;
    }

    private void MoveLeft()
    {
        Rect uvRect = backgroundRawImage.uvRect;
        uvRect.x -= Time.deltaTime * scrollSpeed / textureWidth;
        backgroundRawImage.uvRect = uvRect;
    }

    public void ContiniousLeftMove()
    {
        continiousLeft = true;
        continiousRight = false;
    }

    public void ContiniousRightMove()
    {
        continiousRight = true;
        continiousLeft = false;
    }

    public void Disable_ContiniousLeftMove()
    {
        continiousLeft = false;
        continiousRight = false;
    }

    public void Disable_ContiniousRightMove()
    {
        continiousRight = false;
        continiousLeft = false;
    }

    float GetTextureWidth()
    {
        Texture texture = backgroundRawImage.mainTexture;
        if (texture != null)
            return texture.width;
        else
        {
            Debug.LogError("Texture not found.");
            return 0f;
        }
    }

    public void EnableInteraction()
    {
        canMove = true;
    }

    public void DisableInteraction()
    {
        canMove = false;
    }
}
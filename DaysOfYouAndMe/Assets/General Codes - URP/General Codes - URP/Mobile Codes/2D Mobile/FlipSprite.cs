using UnityEngine;

public class FlipSprite : MonoBehaviour
{
    public GameObject target; // The target GameObject to track

    private SpriteRenderer spriteRenderer;

    void Start()
    {
        // Get the SpriteRenderer component
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    void Update()
    {
        if (target != null)
        {
            // Check the relative position of the target
            if (target.transform.position.x > transform.position.x)
            {
                // Target is to the right, ensure sprite is facing right
                spriteRenderer.flipX = false;
            }
            else if (target.transform.position.x < transform.position.x)
            {
                // Target is to the left, ensure sprite is facing left
                spriteRenderer.flipX = true;
            }
        }
    }
}

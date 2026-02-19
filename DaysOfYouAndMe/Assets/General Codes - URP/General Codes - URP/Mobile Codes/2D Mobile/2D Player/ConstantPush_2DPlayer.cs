using UnityEngine;

public enum PushDirection
{
    Right,
    Left
}

public class ConstantPush_2DPlayer : MonoBehaviour
{
    public PushDirection pushDirection = PushDirection.Right;
    public float pushForce = 750f;

    private Rigidbody2D rb;

    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        if (rb == null)
        {
            Debug.LogError("Rigidbody2D component not found on GameObject.");
            enabled = false;
        }
    }

    void FixedUpdate()
    {
        Vector2 forceDirection = pushDirection == PushDirection.Right ? Vector2.right : Vector2.left;
        rb.AddForce(forceDirection * pushForce, ForceMode2D.Force);
    }
}

using UnityEngine;

public class PlayerMovement_SidesOnly : MonoBehaviour
{
    public float forwardSpeed = 7f;   // Forward movement speed
    public float sidesSpeed = 7f;    // Lateral movement speed
    public float sidesDistance = 3f; // Distance to move left or right     

    private int currentIndex = 0;      // Index of the current target position
    private bool isMovingLaterally = false; // Indicates if the player is currently moving laterally
    private Vector3 initialPosition;   // Initial position of the player

    void Start()
    {
        // Store the initial position
        initialPosition = transform.position;
    }

    void Update()
    {
        // Constantly move the player forward
        transform.position += Vector3.forward * forwardSpeed * Time.deltaTime;

        // Calculate the target lateral position based on the current index
        Vector3 targetPosition = initialPosition + Vector3.right * sidesDistance * currentIndex;

        // Move towards the current lateral target position if isMovingLaterally is true
        if (isMovingLaterally)
        {
            transform.position = Vector3.MoveTowards(transform.position, new Vector3(targetPosition.x, transform.position.y, transform.position.z), sidesSpeed * Time.deltaTime);

            // Check if the player has reached the target lateral position
            if (Mathf.Approximately(transform.position.x, targetPosition.x))
            {
                isMovingLaterally = false; // Stop moving laterally when the target is reached
            }
        }

        // Check for input and update the current index
        if (Input.GetKeyDown(KeyCode.D))
        {
            currentIndex++;
            isMovingLaterally = true;
        }
        else if (Input.GetKeyDown(KeyCode.A))
        {
            currentIndex--;
            isMovingLaterally = true;
        }
    }
}

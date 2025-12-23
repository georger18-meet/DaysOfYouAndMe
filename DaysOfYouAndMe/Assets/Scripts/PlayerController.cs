using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private CharacterController _charCon;

    public float moveSpeed = 10;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        _charCon = GetComponent<CharacterController>();
    }

    // Update is called once per frame
    void Update()
    {
        Vector2 moveAxis = new Vector2(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));

        Vector3 movement = transform.right * moveAxis.x + transform.forward * moveAxis.y;

        _charCon.Move(movement * moveSpeed * Time.deltaTime);
    }
}

using UnityEngine;

public class Move : MonoBehaviour
{
    public float Movespeed = 1.0f;
    public float Turnspeed = 90f;
    public float jumpHeight = 5f;
    public bool ControlsOn = false;

    private void FixedUpdate()
    {
        if (ControlsOn == false)
            return;

        float vert = Input.GetAxis("Vertical");
        float horz = Input.GetAxis("Horizontal");
        this.transform.Translate(Vector3.forward * vert * Movespeed * Time.deltaTime);
        this.transform.localRotation *= Quaternion.AngleAxis(horz * Turnspeed * Time.deltaTime, Vector3.up);

        if (Input.GetKey(KeyCode.Space) == true)
        {
            this.transform.Translate(Vector3.up * jumpHeight * Time.deltaTime);
        }        
    }
}

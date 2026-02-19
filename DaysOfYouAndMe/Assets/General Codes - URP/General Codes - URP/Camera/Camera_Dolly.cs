using UnityEngine;

public class Camera_Dolly : MonoBehaviour
{
    // camera will follow this object
    public Transform Target;
    //camera transform
    public Transform camTransform;
    // offset between camera and target
    public Vector3 Offset;
    // change this value to get desired smoothness
    public float distance = 30f;
    public float SmallerDistance = 2.5f;
    private float OriginalDistance;
    private int anglesList;
        
    

    // This value will change at the runtime depending on target movement. Initialize with zero vector.
    private Vector3 velocity = Vector3.zero;

    private void Start()
    {
        anglesList = 0;
        Offset = camTransform.position - Target.position;
        OriginalDistance = distance;
        
    }

    private void LateUpdate()
    {

        if (anglesList == 0 || anglesList == 1 || anglesList == 2 || anglesList == 3 || anglesList == 4 || anglesList == 5 || anglesList == 6)
        {
            
            Vector3 targetPosition = Target.position + Offset;
            camTransform.position = Vector3.SmoothDamp(transform.position, targetPosition, ref velocity, distance);
            transform.LookAt(Target);
            

        }

        if (anglesList == 7 || anglesList == 8 || anglesList == 9 || anglesList == 10 || anglesList == 11 || anglesList == 12 || anglesList == 13)
        {
            Vector3 targetPosition = Target.position - Offset;
            camTransform.position = Vector3.SmoothDamp(transform.position, targetPosition, ref velocity, distance);
            transform.LookAt(Target);
        }



    }

    public void Regular_DollyFixedAngle()
    {

        anglesList = 0;
        velocity = Vector3.zero;
        
        distance = SmallerDistance;
       

    }

    public void Regular_DollyUp()
    {

        anglesList = 1;
        velocity = Vector3.zero + Vector3.up;
        
        distance = OriginalDistance;
    }

    public void Regular_DollyDown()
    {

        anglesList = 2;
        velocity = Vector3.zero - Vector3.up;

        distance = OriginalDistance;
    }

    public void Regular_DollyBack()
    {

        anglesList = 3;
        velocity = Vector3.zero + Vector3.left;

        distance = OriginalDistance;

    }

    public void Regular_DollyForward()
    {

        anglesList = 4;
        velocity = Vector3.zero - Vector3.left;

        distance = OriginalDistance;

    }

    public void Regular_DollyLeft()
    {

        anglesList = 5;
        velocity = Vector3.zero + Vector3.forward;

        distance = OriginalDistance;

    }

    public void Regular_DollyRight()
    {

        anglesList = 6;
        velocity = Vector3.zero - Vector3.forward;

        distance = OriginalDistance;

    }

    public void Reverse_DollyFixedAngle()
    {

        anglesList = 7;
        velocity = Vector3.zero;

        distance = SmallerDistance;


    }

    public void Reverse_DollyUp()
    {

        anglesList = 8;
        velocity = Vector3.zero + Vector3.up;

        distance = OriginalDistance;
    }

    public void Reverse_DollyDown()
    {

        anglesList = 9;
        velocity = Vector3.zero - Vector3.up;

        distance = OriginalDistance;
    }

    public void Reverse_DollyBack()
    {

        anglesList = 10;
        velocity = Vector3.zero + Vector3.left;

        distance = OriginalDistance;

    }

    public void Reverse_DollyForward()
    {

        anglesList = 11;
        velocity = Vector3.zero - Vector3.left;

        distance = OriginalDistance;

    }

    public void Reverse_DollyLeft()
    {

        anglesList = 12;
        velocity = Vector3.zero + Vector3.forward;

        distance = OriginalDistance;

    }

    public void Reverse_DollyRight()
    {

        anglesList = 13;
        velocity = Vector3.zero - Vector3.forward;

        distance = OriginalDistance;

    }


}
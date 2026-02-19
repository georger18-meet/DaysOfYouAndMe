using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveCameraToPosition : MonoBehaviour
{
    public Transform[] newPositions;
    public Transform Cam;
    public float CamMoveSpeed = 1f;

    private bool isMoved0 = false;
    private bool isMoved1 = false;
    private bool isMoved2 = false;
    private bool isMoved3 = false;
    private bool isMoved4 = false;

    private void LateUpdate()
    {
        if (isMoved0 == true)
        {
            Cam.transform.position = Vector3.Lerp(Cam.transform.position, newPositions[0].position,
                CamMoveSpeed * Time.deltaTime);

            Cam.transform.rotation = Quaternion.Lerp(Cam.transform.rotation, newPositions[0].rotation,
              CamMoveSpeed * Time.deltaTime);
        }

        if (isMoved1 == true)
        {
           Cam.transform.position = Vector3.Lerp(Cam.transform.position, newPositions[1].position, 
               CamMoveSpeed * Time.deltaTime);

            Cam.transform.rotation = Quaternion.Lerp(Cam.transform.rotation, newPositions[1].rotation,
              CamMoveSpeed * Time.deltaTime);
        }

        if (isMoved2 == true)
        {
            Cam.transform.position = Vector3.Lerp(Cam.transform.position, newPositions[2].position,
                CamMoveSpeed * Time.deltaTime);

            Cam.transform.rotation = Quaternion.Lerp(Cam.transform.rotation, newPositions[2].rotation,
              CamMoveSpeed * Time.deltaTime);
        }

        if (isMoved3 == true)
        {
            Cam.transform.position = Vector3.Lerp(Cam.transform.position, newPositions[3].position,
                CamMoveSpeed * Time.deltaTime);

            Cam.transform.rotation = Quaternion.Lerp(Cam.transform.rotation, newPositions[3].rotation,
              CamMoveSpeed * Time.deltaTime);
        }

        if (isMoved4 == true)
        {
            Cam.transform.position = Vector3.Lerp(Cam.transform.position, newPositions[4].position,
                CamMoveSpeed * Time.deltaTime);

            Cam.transform.rotation = Quaternion.Lerp(Cam.transform.rotation, newPositions[4].rotation,
              CamMoveSpeed * Time.deltaTime);
        }
    }

    public void MoveToPosition0()
    {
        isMoved0 = true;
        isMoved1 = false;
        isMoved2 = false;
        isMoved3 = false;
        isMoved4 = false;
    }
    public void MoveToPosition1()
    {
        isMoved0 = false;
        isMoved1 = true;
        isMoved2 = false;
        isMoved3 = false;
        isMoved4 = false;
    }
    public void MoveToPosition2()
    {
        isMoved0 = false;
        isMoved1 = false;
        isMoved2 = true;
        isMoved3 = false;
        isMoved4 = false;
    }
    public void MoveToPosition3()
    {
        isMoved0 = false;
        isMoved1 = false;
        isMoved2 = false;
        isMoved3 = true;
        isMoved4 = false;
    }
    public void MoveToPosition4()
    {
        isMoved0 = false;
        isMoved1 = false;
        isMoved2 = false;
        isMoved3 = false;
        isMoved4 = true;
    }

}

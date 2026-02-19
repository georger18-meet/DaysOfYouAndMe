using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SnapTo : MonoBehaviour
{
    public GameObject WhichObjectToSnap;
    public GameObject SnapToThisObject;
    private bool isSnapping = false;    

    private void Update()
    {
        if (isSnapping == true)
        {
            WhichObjectToSnap.transform.position = SnapToThisObject.transform.position;
        }
    }

    public void StartSnap()
    {
        isSnapping = true;
    }

    public void StopSnap()
    {
        isSnapping = false;
    }
}

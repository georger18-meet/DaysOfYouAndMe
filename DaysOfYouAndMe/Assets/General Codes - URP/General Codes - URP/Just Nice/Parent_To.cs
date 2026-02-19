using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Parent_To : MonoBehaviour
{
    public GameObject WhichObjectToParent;
    public GameObject ParentToThisObject;

    public void StartParent()
    {
        WhichObjectToParent.transform.parent = ParentToThisObject.transform;
    }

    public void StopParent()
    {
        WhichObjectToParent.transform.parent = null;
    }
}

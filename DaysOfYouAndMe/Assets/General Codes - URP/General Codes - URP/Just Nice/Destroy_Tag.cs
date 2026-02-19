using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Destroy_Tag : MonoBehaviour
{
    public string tagOfObjectsToDestroy;
    public float delay = 0f;

    public void DestroyObjectsWithTag()
    {
        foreach (var gameObj in GameObject.FindGameObjectsWithTag(tagOfObjectsToDestroy))
        {
            Destroy(gameObj, delay);
        }
    }
}

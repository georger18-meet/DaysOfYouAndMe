using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Destroy_This : MonoBehaviour
{
    public float delay = 0f;
    
    public void DestroyThis()
    {
        Destroy(this.gameObject, delay);
    }
}

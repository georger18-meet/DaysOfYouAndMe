using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SlowMotion : MonoBehaviour
{
    public float howSlow = 0.5f;
    
    public void Start_SlowMotion()
    {
        Time.timeScale = howSlow;
        Time.fixedDeltaTime = 0.02f * Time.timeScale;
    }

    public void Stop_SlowMotion()
    {
        Time.timeScale = 1f;
        Time.fixedDeltaTime = 0.02f * Time.timeScale;
    }
}

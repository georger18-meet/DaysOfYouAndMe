using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class URL : MonoBehaviour
    
{
    public string Link;
  public void OpenURL ()
    {
        Application.OpenURL(Link);
       
    }
}

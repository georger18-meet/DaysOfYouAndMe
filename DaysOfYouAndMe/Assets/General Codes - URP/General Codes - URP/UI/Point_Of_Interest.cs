using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//POI_Canvas should be a prefab with a RawImage that has the POI icon.

public class Point_Of_Interest : MonoBehaviour
{
    public GameObject POI_Canvas;    
    public Vector3 offsetPos = new Vector3 (0, 0.5f, 0);
    public Vector3 offsetRot = new Vector3(0, 90f, 0);

    private void Start()
    {        
        GameObject poicanvas = Instantiate(POI_Canvas, this.transform.position, Quaternion.identity);
        poicanvas.transform.SetParent(this.transform);        
        poicanvas.transform.position = this.transform.position + offsetPos;
        poicanvas.transform.eulerAngles = offsetRot;
    }
}

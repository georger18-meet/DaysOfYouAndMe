using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Shoot_Bullet : MonoBehaviour
{
    public GameObject bulletPrefab;
    public Transform gunEndPoint;
    public KeyCode keyToShoot = KeyCode.Mouse0;    
    public float force = 20000f;
    public UnityEvent ShootEvent;    
    
    void Update()
    {
        if (Input.GetKeyDown(keyToShoot))
        {
            GameObject bullet = Instantiate(bulletPrefab, gunEndPoint.position, gunEndPoint.rotation);            
            bullet.GetComponent<Rigidbody>().AddForce(Camera.main.transform.forward * Time.deltaTime * force);
            ShootEvent.Invoke();
            Destroy(bullet, 5f);
        }
    }   
}

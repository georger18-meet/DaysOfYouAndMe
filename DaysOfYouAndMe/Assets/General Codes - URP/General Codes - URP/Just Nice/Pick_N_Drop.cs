using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Pick_N_Drop : MonoBehaviour
{

    public Transform player_hands;
    public Transform drop_spot;

    public UnityEvent gotPicked;
    public UnityEvent gotDropped;

    public void Picked_Up()
    {
        this.transform.position = player_hands.position;
        this.transform.parent = player_hands;
        gotPicked.Invoke();
    }

    public void Dropped()
    {
        this.transform.position = drop_spot.position;
        this.transform.parent = drop_spot;
        gotDropped.Invoke();
    }

}

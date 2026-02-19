using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Animator))]
public class IKFootPlacement1 : MonoBehaviour
{
    private Animator anim;
    public LayerMask PlayerLayerMask; // Select all layers that foot placement applies to - except *this* gameobject (player).
    [Range(0, 1f)]
    public float DistanceToGround = 0.1f; // Distance from where the foot transform is to the lowest possible position of the foot.
    [Range(0, 10f)]
    public float DistanceToGroundMultiplier = 1.5f;  //How much the feet & legs stick to the ground...     
    //public bool IKValueFromAnimationsCurves = true;
    [Range(0, 1f)]
    public float Left_IKValue = 1f;
    [Range(0, 1f)]
    public float Right_IKValue = 1f;    

    private void Awake()
    {
        anim = this.GetComponent<Animator>();
    }   

    private void OnAnimatorIK(int layerIndex)
    {      
            anim.SetIKPositionWeight(AvatarIKGoal.LeftFoot, Left_IKValue);
            anim.SetIKRotationWeight(AvatarIKGoal.LeftFoot, Left_IKValue);
            anim.SetIKPositionWeight(AvatarIKGoal.RightFoot, Right_IKValue);
            anim.SetIKRotationWeight(AvatarIKGoal.RightFoot, Right_IKValue);            

            // Left Foot
            RaycastHit hit;
            // We cast our ray from above the foot in case the current terrain/floor is above the foot position.
            Ray ray = new Ray(anim.GetIKPosition(AvatarIKGoal.LeftFoot) + Vector3.up, Vector3.down);
            if (Physics.Raycast(ray, out hit, DistanceToGround + DistanceToGroundMultiplier, PlayerLayerMask))
            {              
                Vector3 footPosition = hit.point; // The target foot position is where the raycast hit a walkable object...
                footPosition.y += DistanceToGround; // ... taking account the distance to the ground we added above.
                anim.SetIKPosition(AvatarIKGoal.LeftFoot, footPosition);                
                Vector3 forward = Vector3.ProjectOnPlane(transform.forward, hit.normal);
                anim.SetIKRotation(AvatarIKGoal.LeftFoot, Quaternion.LookRotation(forward, hit.normal));

            //if (Vector3.Distance(hit.origin, footPosition) > DistanceToGround)
            //{
            //    Left_IKValue = 0f;
            //}
            //if (Vector3.Distance(hit.origin, footPosition) < DistanceToGround)
            //{
            //    Left_IKValue = 1f;
            //}
        }

        // Right Foot
        ray = new Ray(anim.GetIKPosition(AvatarIKGoal.RightFoot) + Vector3.up, Vector3.down);
            if (Physics.Raycast(ray, out hit, DistanceToGround + DistanceToGroundMultiplier, PlayerLayerMask))
            {              
                Vector3 footPosition = hit.point;
                footPosition.y += DistanceToGround;
                anim.SetIKPosition(AvatarIKGoal.RightFoot, footPosition);               
                Vector3 forward = Vector3.ProjectOnPlane(transform.forward, hit.normal);
                anim.SetIKRotation(AvatarIKGoal.RightFoot, Quaternion.LookRotation(forward, hit.normal));

            //if (Vector3.Distance(hit.origin, footPosition) > DistanceToGround)
            //{
            //    Right_IKValue = 0f;
            //}
            //if (Vector3.Distance(hit.origin, footPosition) < DistanceToGround)
            //{
            //    Right_IKValue = 1f;
            //}
        }
    }
}

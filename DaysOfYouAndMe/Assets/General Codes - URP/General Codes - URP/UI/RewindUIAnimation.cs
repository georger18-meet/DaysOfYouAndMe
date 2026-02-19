using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// use this script to start an animation from a specific frame in it, via code.
// it can be used to re-start an animation (0 frame), or choose another frame, as you wish.
// it can be used for UI animation, or any other animation clip!

public class RewindUIAnimation : MonoBehaviour
{
    public AnimationClip clip;
    

    public void Rewind()
    {
        
        clip.SampleAnimation(this.gameObject, 0);
    }
}

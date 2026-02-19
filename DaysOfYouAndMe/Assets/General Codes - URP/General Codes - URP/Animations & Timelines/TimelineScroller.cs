using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.UI;

public class TimelineScroller : MonoBehaviour
{
    public PlayableDirector director;
    public Scrollbar scrollbarToControlTimeline;
    private float actTime;

    public void SetTime()
    {
        Debug.Log(scrollbarToControlTimeline.value);
        float maxTime = (float)director.duration;

        actTime = scrollbarToControlTimeline.value * maxTime;

        director.time = actTime;
        director.RebuildGraph();
        director.Play();
        director.playableGraph.GetRootPlayable(0).SetSpeed(0);
    }
}
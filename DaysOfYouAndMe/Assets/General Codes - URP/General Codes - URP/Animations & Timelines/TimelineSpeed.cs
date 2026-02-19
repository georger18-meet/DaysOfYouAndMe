using UnityEngine;
using UnityEngine.Playables;
public class TimelineSpeed : MonoBehaviour
{
    public float newSpeed;
    public float newSpeed2;
    public PlayableDirector pd;

    void Start()
    {
        pd = GetComponent<PlayableDirector>();        
    }

    public void NewTimelineSpeed()
    {
        pd.playableGraph.GetRootPlayable(0).SetSpeed(newSpeed);
    }

    public void NewTimelineSpeed2()
    {
        pd.playableGraph.GetRootPlayable(0).SetSpeed(newSpeed2);
    }
}
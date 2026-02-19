// File: VideoPlayableBehaviour.cs
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Video;

public class VideoPlayableBehaviour : PlayableBehaviour
{
    public VideoPlayer videoPlayer;
    public VideoClip videoClip;

    public override void OnBehaviourPlay(Playable playable, FrameData info)
    {
        if (videoPlayer != null && videoClip != null)
        {
            videoPlayer.clip = videoClip;
            videoPlayer.Play();
        }
    }

    public override void OnBehaviourPause(Playable playable, FrameData info)
    {
        if (videoPlayer != null)
        {
            videoPlayer.Pause();
        }
    }

    public override void OnGraphStop(Playable playable)
    {
        if (videoPlayer != null)
        {
            videoPlayer.Stop();
        }
    }
}

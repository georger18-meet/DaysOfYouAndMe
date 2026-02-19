// File: VideoPlayableAsset.cs
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using UnityEngine.Video;

[System.Serializable]
public class VideoPlayableAsset : PlayableAsset, ITimelineClipAsset
{
    public ExposedReference<VideoPlayer> videoPlayer;
    public VideoClip videoClip;

    public ClipCaps clipCaps
    {
        get { return ClipCaps.None; }
    }

    public override Playable CreatePlayable(PlayableGraph graph, GameObject owner)
    {
        var playable = ScriptPlayable<VideoPlayableBehaviour>.Create(graph);
        VideoPlayableBehaviour videoPlayableBehaviour = playable.GetBehaviour();

        videoPlayableBehaviour.videoPlayer = videoPlayer.Resolve(graph.GetResolver());
        videoPlayableBehaviour.videoClip = videoClip;

        return playable;
    }
}

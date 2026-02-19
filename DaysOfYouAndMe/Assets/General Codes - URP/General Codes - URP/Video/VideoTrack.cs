// File: VideoTrack.cs
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using UnityEngine.Video;

[TrackColor(0.855f, 0.8623f, 0.87f)]
[TrackClipType(typeof(VideoPlayableAsset))]
[TrackBindingType(typeof(VideoPlayer))]
public class VideoTrack : TrackAsset
{
    public override Playable CreateTrackMixer(PlayableGraph graph, GameObject go, int inputCount)
    {
        // Creates a PlayableBehavior for controlling the video clip
        return ScriptPlayable<VideoPlayableMixerBehaviour>.Create(graph, inputCount);
    }
}

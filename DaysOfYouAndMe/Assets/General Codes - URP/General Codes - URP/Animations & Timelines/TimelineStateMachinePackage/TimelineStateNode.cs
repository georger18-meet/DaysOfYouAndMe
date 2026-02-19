using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using XNode;
using System.Collections.Generic;

[System.Serializable]
public class TimelineBinding
{
    public string trackName;
    public int objectIndex = -1; // Index in the referenceObjects array
}

[System.Serializable]
public class TimelineStateNode : Node
{
    [Input(backingValue = ShowBackingValue.Never)] public TimelineStateNode previous; // Only non-start nodes have previous input
    [Output] public TimelineStateNode next; // Single next connection

    [Header("State Settings")]
    public string stateName; // Name of the state
    public TimelineAsset timelineAsset; // Reference the TimelineAsset directly instead of PlayableDirector

    [Header("Binding Settings")]
    public List<TimelineBinding> trackBindings = new List<TimelineBinding>();

    [Header("Transition Settings")]
    public bool useTrigger = false; // Determines if transition requires a trigger
    public string transitionTrigger; // Trigger string

    // Runtime reference to the PlayableDirector
    [System.NonSerialized]
    public PlayableDirector playableDirector;

    public void OnValidate()
    {
        // Update node name in XNode UI
        name = string.IsNullOrEmpty(stateName) ? "State" : stateName;

        // Set as start node if it's the first node in the graph
        if (graph != null)
        {
            TimelineGraph timelineGraph = (TimelineGraph)graph;
            if (timelineGraph.startNode == null || timelineGraph.startNode == this)
            {
#if UNITY_EDITOR
                timelineGraph.SetStartNode(this);
#else
                timelineGraph.startNode = this;
#endif
            }
        }
    }

    public void Setup(PlayableDirector director, GameObject[] referenceObjects)
    {
        playableDirector = director;

        if (playableDirector != null && timelineAsset != null)
        {
            // Set the timeline asset
            playableDirector.playableAsset = timelineAsset;

            // Apply bindings
            ApplyBindings(referenceObjects);
        }
    }

    private void ApplyBindings(GameObject[] referenceObjects)
    {
        if (playableDirector == null || timelineAsset == null) return;

        // Apply any specific bindings defined for this node
        foreach (var binding in trackBindings)
        {
            foreach (var track in timelineAsset.GetOutputTracks())
            {
                if (track.name == binding.trackName)
                {
                    if (binding.objectIndex >= 0 && binding.objectIndex < referenceObjects.Length)
                    {
                        // Use the reference from the array
                        playableDirector.SetGenericBinding(track, referenceObjects[binding.objectIndex]);
                    }
                    break;
                }
            }
        }
    }

    public void Play()
    {
        if (playableDirector != null)
        {
            playableDirector.Play();
        }
    }

    public bool HasFinishedPlaying()
    {
        return playableDirector == null || playableDirector.state != PlayState.Playing;
    }

    // Required for XNode to function properly
    public override object GetValue(NodePort port)
    {
        return port.fieldName == "next" ? next : null;
    }
}
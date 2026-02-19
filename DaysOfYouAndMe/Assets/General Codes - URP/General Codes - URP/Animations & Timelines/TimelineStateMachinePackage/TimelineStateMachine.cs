using UnityEngine;
using UnityEngine.Playables;
using XNode;
using System.Collections;

public class TimelineStateMachine : MonoBehaviour
{
    public TimelineGraph graph;
    public bool playOnAwake = true; // Option to control if the graph starts automatically

    [Tooltip("GameObject references used in timelines - assigned in editor, used at runtime")]
    public GameObject[] referenceObjects;

    // Reference to the PlayableDirector to use for all timelines
    public PlayableDirector playableDirector;

    private TimelineStateNode currentState;

    void Awake()
    {
        // Verify we have a PlayableDirector
        if (playableDirector == null)
        {
            playableDirector = GetComponent<PlayableDirector>();
            if (playableDirector == null)
            {
                playableDirector = gameObject.AddComponent<PlayableDirector>();
            }
        }

        if (playOnAwake)
        {
            PlayGraph();
        }
    }

    public void PlayGraph()
    {
        if (graph == null)
        {
            Debug.LogError("No graph assigned to TimelineStateMachine!");
            return;
        }

        TimelineStateNode startNode = graph.GetStartNode();
        if (startNode == null)
        {
            Debug.LogError("No valid start node found in the graph!");
            return;
        }

        PlayState(startNode);
    }

    public void StopGraph()
    {
        if (playableDirector != null)
        {
            playableDirector.Stop();
        }
        currentState = null;
    }

    public void PauseGraph()
    {
        if (playableDirector != null)
        {
            playableDirector.Pause();
        }
    }

    private void PlayState(TimelineStateNode newState)
    {
        if (newState == null || newState == currentState) return;

        currentState = newState;

        // Setup the new state with our PlayableDirector and reference objects
        currentState.Setup(playableDirector, referenceObjects);

        // Play the timeline
        currentState.Play();

        // If no trigger is required, automatically transition to the next state
        if (!currentState.useTrigger)
        {
            StartCoroutine(AutoTransition());
        }
    }

    private IEnumerator AutoTransition()
    {
        while (currentState != null && !currentState.HasFinishedPlaying())
        {
            yield return null; // Wait until timeline finishes
        }

        if (currentState != null)
        {
            NodePort port = currentState.GetOutputPort("next");
            if (port.IsConnected)
            {
                TimelineStateNode targetNode = port.Connection?.node as TimelineStateNode;
                if (targetNode != null)
                {
                    PlayState(targetNode);
                }
            }
        }
    }

    public void TriggerTransition(string trigger)
    {
        if (currentState == null) return;

        NodePort port = currentState.GetOutputPort("next");
        if (port.IsConnected)
        {
            TimelineStateNode targetNode = port.Connection?.node as TimelineStateNode;
            if (targetNode != null && targetNode.useTrigger && targetNode.transitionTrigger == trigger)
            {
                PlayState(targetNode);
            }
        }
    }
}
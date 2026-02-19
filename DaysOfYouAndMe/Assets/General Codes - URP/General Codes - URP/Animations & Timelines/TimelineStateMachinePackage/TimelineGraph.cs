using UnityEngine;
using XNode;

[CreateAssetMenu(fileName = "TimelineGraph", menuName = "Timeline/State Machine Graph")]
public class TimelineGraph : NodeGraph
{
    public TimelineStateNode startNode;

#if UNITY_EDITOR
    public void SetStartNode(TimelineStateNode node) {
        if (node != null) {
            startNode = node;
            UnityEditor.EditorUtility.SetDirty(this); // Ensure it saves in the editor
        }
    }
#endif

    public TimelineStateNode GetStartNode()
    {
        if (startNode != null)
        {
            return startNode;
        }

        // Automatically assign the first node in the graph as the start node
        foreach (Node node in nodes)
        {
            TimelineStateNode stateNode = node as TimelineStateNode;
            if (stateNode != null)
            {
                startNode = stateNode;
                return stateNode;
            }
        }

        return null;
    }
}
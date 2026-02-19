#if UNITY_EDITOR

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.Animations;

// use this script to record anything a gameobject does in runtime!
// with this, you can convert rigidbodies physics and navmesh movements that are real-time,
// into an animation clip!
// make sure to first create an empty animation clip to put in the inspector, before you hit "Play" and record.
// delete this script or put it in a new folder called Editor - before making a build of your game (or you will see errors).

public class _GameObjectRecorder : MonoBehaviour
{
    public AnimationClip clip;

    private GameObjectRecorder m_Recorder;
    

    void Start()
    {
        // Create recorder and record the script GameObject.
        m_Recorder = new GameObjectRecorder(gameObject);

        // Bind all the Transforms on the GameObject and all its children.
        m_Recorder.BindComponentsOfType<Transform>(gameObject, true);
    }

    void LateUpdate()
    {
        if (clip == null)
            return;

        // Take a snapshot and record all the bindings values for this frame.
        m_Recorder.TakeSnapshot(Time.deltaTime);
    }

    void OnDisable()
    {
        if (clip == null)
            return;

        if (m_Recorder.isRecording)
        {
            // Save the recorded session to the clip.
            m_Recorder.SaveToClip(clip);
        }
    }
}
#endif

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New TextandAudio SO", menuName = "Subtitles: Text and Audio")]
public class Subtitles_SO : ScriptableObject
{
    public string subtitlesText;
    public AudioClip voiceOver;
}
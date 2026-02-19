using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Subtitles_TextandAudio : MonoBehaviour
{
    TextMeshProUGUI txt;
    AudioSource _audio;
    public Subtitles_SO SO_data1;
    public Subtitles_SO SO_data2;
    public Subtitles_SO SO_data3;
    public Subtitles_SO SO_data4;
    public Subtitles_SO SO_data5;
    public Subtitles_SO SO_data6;
    public Subtitles_SO SO_data7;
    public Subtitles_SO SO_data8;
    public Subtitles_SO SO_data9;
    public Subtitles_SO SO_data10;

    void Awake()
    {
        txt = this.GetComponent<TextMeshProUGUI>();
        txt.text = "";
        _audio = this.GetComponent<AudioSource>();
    }

    public void SO_Text1()
    {
        txt.text = SO_data1.subtitlesText;
        _audio.clip = SO_data1.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }
    public void SO_Text2()
    {
        txt.text = SO_data2.subtitlesText;
        _audio.clip = SO_data2.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }
    public void SO_Text3()
    {
        txt.text = SO_data3.subtitlesText;
        _audio.clip = SO_data3.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }
    public void SO_Text4()
    {
        txt.text = SO_data4.subtitlesText;
        _audio.clip = SO_data4.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }
    public void SO_Text5()
    {
        txt.text = SO_data5.subtitlesText;
        _audio.clip = SO_data5.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }

    public void SO_Text6()
    {
        txt.text = SO_data6.subtitlesText;
        _audio.clip = SO_data6.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }

    public void SO_Text7()
    {
        txt.text = SO_data7.subtitlesText;
        _audio.clip = SO_data7.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }

    public void SO_Text8()
    {
        txt.text = SO_data8.subtitlesText;
        _audio.clip = SO_data8.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }

    public void SO_Text9()
    {
        txt.text = SO_data9.subtitlesText;
        _audio.clip = SO_data9.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }

    public void SO_Text10()
    {
        txt.text = SO_data10.subtitlesText;
        _audio.clip = SO_data10.voiceOver;
        _audio.Play();
        StartCoroutine(ClearAfterSeconds());
    }

    public void ClearSubtitle()
    {
        txt.text = "";
    }

    private IEnumerator ClearAfterSeconds()
    {
        yield return new WaitForSeconds(_audio.clip.length);
        ClearSubtitle();
    }
}

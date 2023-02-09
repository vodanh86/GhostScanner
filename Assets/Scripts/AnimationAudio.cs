using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationAudio : MonoBehaviour
{
    // Start is called before the first frame update
    AudioSource audio;

    void Start()
    {
        audio = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update() { }

    public void PlaySound()
    {
        audio.Play();
    }
}

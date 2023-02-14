using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationAudio : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField]
    private AudioClip[] audioClips;
    private AudioSource audioSource;

    void Start()
    {
        audioSource = new GameObject("[Model]AudioSource").AddComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update() { }

    public void PlayRoar()
    {
        if (ConfigManager.Instance != null && ConfigManager.Instance.GetCurrentGhost().sex == "female")
        {
            audioSource.clip = audioClips[0];
        }
        else
        {
            audioSource.clip = audioClips[1];
        }
        audioSource.Play();
    }

    public void PlayAttack()
    {
        audioSource.clip = audioClips[2];
        audioSource.Play();
    }

    public void PlayGrowl()
    {
        audioSource.clip = audioClips[3];
        audioSource.Play();
    }
}

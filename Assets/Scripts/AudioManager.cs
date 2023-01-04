using UnityEngine;

public class AudioManager : MonoBehaviour
{
    // Static singleton property.
    public static AudioManager Instance { get; private set; }

    void Awake()
    {
        // Save a reference to the AudioManager component as our //singleton instance.
        Instance = this;
    }

    // Instance method, this method can be accessed through the //singleton instance
    public void PlayAudio(string clip)
    {
        Debug.Log(clip);
    }
}

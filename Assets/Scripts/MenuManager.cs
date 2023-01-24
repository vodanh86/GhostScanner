using System.Collections;
using UnityEngine.SceneManagement;
using System.Collections.Generic;
using UnityEngine;

public class MenuManager : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField]
    AudioSource clickAudio;

    void Start()
    {
        ConfigManager.Instance.GetLevel();
    }

    // Update is called once per frame
    void Update() { }

    public void GoToScene(string sceneName)
    {
        clickAudio.Play();
        SceneManager.LoadScene(sceneName);
    }

    public void NextLevel()
    {
        clickAudio.Play();
        ConfigManager.Instance.NextLevel();
        SceneManager.LoadScene(Constant.MAIN_SCENE_NAME);
    }
}

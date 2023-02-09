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

    public void GoBack()
    {
        clickAudio.Play();
        if (ConfigManager.Instance.nextScene == Constant.GHOST_SCANNER_SCENE_NAME)
        {
            SceneManager.LoadScene(Constant.GHOST_SCANNER_SCENE_NAME);
        }
        else
        {
            SceneManager.LoadScene(Constant.MAIN_SCENE_NAME);
        }
    }

    public void GoCollection()
    {
        clickAudio.Play();
        ConfigManager.Instance.nextScene = Constant.GHOST_SCANNER_SCENE_NAME;
        SceneManager.LoadScene(Constant.COLLECTION_SCENE_NAME);
    }

    public void SaveLevel()
    {
        clickAudio.Play();
        Utils.SaveModel(ConfigManager.Instance.GetCurrentGhost().name, Constant.SAVED_MODEL);
        ConfigManager.Instance.NextLevel();
        ConfigManager.Instance.nextScene = Constant.MAIN_SCENE_NAME;
        SceneManager.LoadScene(Constant.COLLECTION_SCENE_NAME);
    }

    public void StartScan()
    {
        clickAudio.Play();
        ConfigManager.Instance.startTime = Time.time;
        GoToScene(Constant.GHOST_SCANNER_SCENE_NAME);
    }

    public void Recharge()
    {
        clickAudio.Play();
        GameObject.FindWithTag("GameController").GetComponent<GameManager>().HideEnergyCanvas();
    }

    public void NextLevel()
    {
        clickAudio.Play();
        Utils.SaveModel(ConfigManager.Instance.GetCurrentGhost().name, Constant.NOT_SAVED_MODEL);
        ConfigManager.Instance.NextLevel();
        SceneManager.LoadScene(Constant.MAIN_SCENE_NAME);
    }
}

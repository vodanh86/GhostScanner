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

    private void SaveAndLoadScene(string sceneName)
    {
        ConfigManager.Instance.previousScene = SceneManager.GetActiveScene().name;
        SceneManager.LoadScene(sceneName);
    }

    public void GoToScene(string sceneName)
    {
        clickAudio.Play();
        SaveAndLoadScene(sceneName);
    }

    public void GoBack()
    {
        clickAudio.Play();
        if (ConfigManager.Instance.nextScene == Constant.GHOST_SCANNER_SCENE_NAME)
        {
            SaveAndLoadScene(Constant.GHOST_SCANNER_SCENE_NAME);
        }
        else
        {
            SaveAndLoadScene(Constant.MAIN_SCENE_NAME);
        }
    }

    public void GoCollection()
    {
        clickAudio.Play();
        ConfigManager.Instance.nextScene = Constant.GHOST_SCANNER_SCENE_NAME;
        SaveAndLoadScene(Constant.COLLECTION_SCENE_NAME);
    }

    public void SaveLevel()
    {
        clickAudio.Play();
        AdManager.Ins.ShowVideoAds(
            "CallWhenWatchVideo",
            () =>
            {
                Utils.SaveModel(
                    ConfigManager.Instance.GetCurrentGhost().name,
                    Constant.SAVED_MODEL
                );
                ConfigManager.Instance.NextLevel();
                ConfigManager.Instance.nextScene = Constant.MAIN_SCENE_NAME;
                SaveAndLoadScene(Constant.COLLECTION_SCENE_NAME);
            }
        );
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
        AdManager.Ins.ShowVideoAds(
            "CallWhenWatchVideo",
            GameObject.FindWithTag("GameController").GetComponent<GameManager>().HideEnergyCanvas
        );
    }

    public void ScanMore()
    {
        clickAudio.Play();
        AdManager.Ins.ShowVideoAds(
            "CallWhenWatchVideo",
            GameObject.FindWithTag("GameController").GetComponent<GameManager>().ScanMore
        );
    }

    public void NextLevel()
    {
        clickAudio.Play();
        if (AdManager.Ins.CheckHasRewardAds(true)){
            AdManager.Ins.showInterstitialAds("CallAtEndGame");
        }
        Utils.SaveModel(ConfigManager.Instance.GetCurrentGhost().name, Constant.NOT_SAVED_MODEL);
        ConfigManager.Instance.NextLevel();
        SaveAndLoadScene(Constant.MAIN_SCENE_NAME);
    }
}

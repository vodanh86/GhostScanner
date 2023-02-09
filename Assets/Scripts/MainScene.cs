using UnityEngine;
using TMPro;

public class MainScene : MonoBehaviour
{
    // Start is called before the first frame update

    void Start()
    {
        Time.timeScale = 1;
        string levelContent =
            "Level "
            + ConfigManager.Instance.GetLevel().name
            + "\n"
            + "Ghost name: "
            + ConfigManager.Instance.GetLevel().ghostName;
        ;
        transform.Find("Level").GetComponent<TMP_Text>().text = levelContent;
        transform.Find("Level").GetComponent<TypeWriterEffect>().SetFullText(levelContent);
        transform.Find("Level").GetComponent<TypeWriterEffect>().StartShowTextCoroutine(false);
        /*transform.Find("Ghost").GetComponent<TMP_Text>().text =
            "Ghost name: " + ConfigManager.Instance.GetLevel().ghostName;*/
    }

    public void CallInter()
    {
        AdManager.Ins.showInterstitialAds("CallAtEndGame");
        // AdManager.Ins.ShowVideoAds("CallWhenWatchVideo", RewardOfVideoAds);
    }
    public void CallVideoAds()
    {
        //AdManager.Ins.showInterstitialAds("CallAtEndGame");
         AdManager.Ins.ShowVideoAds("CallWhenWatchVideo", RewardOfVideoAds);
    }
    private void RewardOfVideoAds()
    {
        Debug.Log("Finish Video Ads");
    }
}

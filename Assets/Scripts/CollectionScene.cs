using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class CollectionScene : MonoBehaviour
{
    public GameObject GhostInfor;
    public GameObject Content;
    Texture2D myTexture;

    // Start is called before the first frame update
    void Start()
    {
        bool notEmpty = true;
        Time.timeScale = 1;
        string lastSavedGhosts = PlayerPrefs.GetString(Constant.PLAYER_PREFS_CATCH_TIME);
        if (lastSavedGhosts == null || lastSavedGhosts == "")
        {
            notEmpty = false;
            lastSavedGhosts =
                "1"
                + Constant.PLAYER_PREFS_SEPERATOR
                + "XXXXXX"
                + Constant.PLAYER_PREFS_SEPERATOR
                + Constant.NOT_SAVED_MODEL
                + Constant.PLAYER_PREFS_SEPERATOR;
        }
        string[] ghosts = lastSavedGhosts.Split(
            new string[] { Constant.PLAYER_PREFS_SEPERATOR },
            System.StringSplitOptions.None
        );
        Dictionary<string, string> ghostKey = new Dictionary<string, string>();
        for (int i = 0; i + 1 < ghosts.Length; i += 3)
        {
            if (!ghostKey.ContainsKey(ghosts[i]))
            {
                ghostKey.Add(ghosts[i], ghosts[i + 1]);
                GameObject ghost = Object.Instantiate(GhostInfor, Content.transform);
                Ghost ghostInfor = ConfigManager.Instance.GetGhostInfo(int.Parse(ghosts[i]));

                myTexture = Resources.Load("Images/" + ghostInfor.image) as Texture2D;
                Transform rawImage = ghost.transform.Find("[Image]GhostImage");
                string ghostDescription =
                    "Catched Time: " + ghosts[i + 1] + "\n" + ghostInfor.description + "\n";
                if (ghosts[i + 2] == "1")
                {
                    Utils.ShowGhostInCarosel(ghost.transform, false, false);
                }
                else
                {
                    Utils.ShowGhostInCarosel(ghost.transform, true, notEmpty);
                    Button button = ghost.transform
                        .Find("[Button]Unlock")
                        .GetComponentInChildren<Button>();
                    string tmpLevel = ghosts[i];
                    Transform transform = ghost.transform;
                    button.onClick.AddListener(() =>
                    {
                        SoundManager.Instance.PlayClick();
                        Utils.SaveModel(tmpLevel, Constant.SAVED_MODEL);
                        Utils.ShowGhostInCarosel(transform, false, false);
                    });
                }
                rawImage.GetComponent<RawImage>().texture = myTexture;
                ghost.transform.Find("[Text]Name").GetComponentInChildren<TMP_Text>().text =
                    ghostInfor.ghostName;
                ghost.transform.Find("[Text]Description").GetComponentInChildren<TMP_Text>().text =
                    ghostDescription;
            }
        }
        // preload main
        AsyncOperation async = SceneManager.LoadSceneAsync("GhostScanner", LoadSceneMode.Single);
        async.allowSceneActivation = false;
    }

    // Update is called once per frame
    void Update() { }
}

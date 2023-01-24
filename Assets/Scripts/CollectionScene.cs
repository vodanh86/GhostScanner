using System.Collections;
using System.Collections.Generic;
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
        Time.timeScale = 1;
        string lastSavedGhosts = PlayerPrefs.GetString(Constant.PLAYER_PREFS_CATCH_TIME);
        if (lastSavedGhosts != null)
        {
            string[] ghosts = lastSavedGhosts.Split(
                new string[] { Constant.PLAYER_PREFS_SEPERATOR },
                System.StringSplitOptions.None
            );
            Dictionary<string, string> ghostKey = new Dictionary<string, string>();
            for (int i = 0; i + 1 < ghosts.Length; i += 2)
            {
                if (!ghostKey.ContainsKey(ghosts[i]))
                {
                    ghostKey.Add(ghosts[i], ghosts[i + 1]);
                    GameObject ghost = Object.Instantiate(GhostInfor, Content.transform);
                    Level levelInfor = ConfigManager.Instance.GetLevelInfo(int.Parse(ghosts[i]));

                    myTexture = Resources.Load("Images/" + levelInfor.image) as Texture2D;
                    Transform rawImage = ghost.transform.Find("[Image]GhostImage");
                    string ghostDescription =
                        levelInfor.ghostName
                        + "\n"
                        + "Catched Time: "
                        + ghosts[i + 1]
                        + "\n"
                        + levelInfor.description;
                    rawImage.GetComponent<RawImage>().texture = myTexture;
                    ghost.transform.Find("[Text]Description").GetComponentInChildren<TMP_Text>().text =
                        ghostDescription;
                    /*ghost.transform
                        .Find("[Text]CatchTime")
                        .GetComponentInChildren<TMP_Text>()
                        .text = "Catched Time: " + ghosts[i + 1];
                    ghost.transform
                        .Find("[Text]Description")
                        .GetComponentInChildren<TMP_Text>()
                        .text = levelInfor.ghostName;*/
                }
            }
        }
    }

    // Update is called once per frame
    void Update() { }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class CollectionScene : MonoBehaviour
{
    public GameObject GhostInfor;
    public GameObject Content;

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
                    ghost.transform.Find("Name").GetComponentInChildren<TMP_Text>().text =
                        ConfigManager.Instance.GetLevelInfo(int.Parse(ghosts[i])).ghostName;
                    ghost.transform.Find("CatchTime").GetComponentInChildren<TMP_Text>().text =
                        "Catched Time: " + ghosts[i + 1];
                    ghost.transform.Find("Description").GetComponentInChildren<TMP_Text>().text =
                        ConfigManager.Instance.GetLevelInfo(int.Parse(ghosts[i])).ghostName;
                }
            }
        }
    }

    // Update is called once per frame
    void Update() { }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class Utils
{
    // Start is called before the first frame update
    private static Dictionary<string, SavedLevel> LoadFromPlayerPrefs()
    {
        string savedLevels = PlayerPrefs.GetString(Constant.PLAYER_PREFS_CATCH_TIME);
        Dictionary<string, SavedLevel> levels = new Dictionary<string, SavedLevel>();
        if (savedLevels != null && savedLevels != "")
        {
            string[] seperatedLevels = savedLevels.Split(
                new string[] { Constant.PLAYER_PREFS_SEPERATOR },
                System.StringSplitOptions.None
            );
            for (int i = 0; i + 1 < seperatedLevels.Length; i += 3)
            {
                levels.Add(
                    seperatedLevels[i],
                    new SavedLevel(seperatedLevels[i + 1], seperatedLevels[i + 2])
                );
            }
        }
        return levels;
    }

    private static void SaveToPlayerPrefs(Dictionary<string, SavedLevel> levels)
    {
        string serializedLevels = "";
        foreach (string key in levels.Keys)
        {
            serializedLevels +=
                key
                + Constant.PLAYER_PREFS_SEPERATOR
                + levels[key].catchedTime
                + Constant.PLAYER_PREFS_SEPERATOR
                + levels[key].catched
                + Constant.PLAYER_PREFS_SEPERATOR;
        }
        PlayerPrefs.SetString(Constant.PLAYER_PREFS_CATCH_TIME, serializedLevels);
    }

    public static void SaveModel(string level, string owned)
    {
        Dictionary<string, SavedLevel> levels = LoadFromPlayerPrefs();
        if (levels.ContainsKey(level))
        {
            SavedLevel updatedLevel = levels[level];
            updatedLevel.catchedTime = System.DateTime.Now.ToString();
            if (owned == Constant.SAVED_MODEL)
            {
                updatedLevel.catched = owned;
            }
        }
        else
        {
            levels.Add(level, new SavedLevel(System.DateTime.Now.ToString(), owned));
        }
        SaveToPlayerPrefs(levels);
    }

    public static void ShowGhostInCarosel(Transform transform, bool coverStatus, bool buttonStatus)
    {
        transform.Find("[Image]Cover").gameObject.SetActive(coverStatus);
        transform.Find("[Button]Unlock").gameObject.SetActive(buttonStatus);
    }

    public static string ConvertSecond(int timer)
    {
        float minutes = Mathf.Floor(timer / 60);
        float seconds = Mathf.RoundToInt(timer % 60);

        string strMinutes = minutes < 10 ? "0" + minutes.ToString() : minutes.ToString();
        string strSeconds =
            seconds < 10 ? "0" + Mathf.RoundToInt(seconds).ToString() : seconds.ToString();

        return strMinutes + ":" + strSeconds;
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class Utils
{
    // Start is called before the first frame update
    public static void SaveModel(string level, string owned)
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
        /*SavedLevels savedLevels = new SavedLevels();
        SavedLevel savedLevel = new SavedLevel();
        savedLevel.catched = "1";
        savedLevel.catchedTime = System.DateTime.Now.ToString();

        savedLevels.levels = new Dictionary<string, SavedLevel>();
        savedLevels.levels.Add(level, savedLevel);

        Debug.Log(savedLevels.levels);
        Debug.Log(JsonUtility.ToJson(savedLevels));*/
        PlayerPrefs.SetString(Constant.PLAYER_PREFS_CATCH_TIME, serializedLevels);
    }
}

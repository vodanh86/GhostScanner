using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConfigManager : MonoBehaviour
{
    public static ConfigManager Instance = null;

    public TextAsset levelConfig;

    private Dictionary<int, Level> levelsInJson = new Dictionary<int, Level>();

    private int currentLevel;

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else if (Instance != this)
        {
            Destroy(this);
        }

        DontDestroyOnLoad(gameObject);
        this.LoadAllConfigs();
    }

    private void LoadAllConfigs()
    {
        Levels levels = JsonUtility.FromJson<Levels>(levelConfig.text);
        for (int i = 0; i < levels.levels.Length; i++)
        {
            levelsInJson.Add(i + 1, levels.levels[i]);
        }

        int level = PlayerPrefs.GetInt("level");
        currentLevel = level > 0 ? level : 1;
    }

    public void NextLevel()
    {
        currentLevel++;
        currentLevel = currentLevel >= levelsInJson.Count ? 1 : currentLevel;

        PlayerPrefs.SetInt("level", currentLevel);
    }

    public int GetCurrentLevel()
    {
        return currentLevel;
    }

    public Level GetLevelInfo(int level)
    {
        return levelsInJson[level];
    }

    public Level GetLevel()
    {
        return levelsInJson[currentLevel];
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConfigManager : MonoBehaviour
{
    public static ConfigManager Instance = null;

    public TextAsset levelConfig;
    public TextAsset ghostConfig;

    public string nextScene;

    private Dictionary<int, Level> levelsInJson = new Dictionary<int, Level>();
    private Dictionary<int, Ghost> ghostsInJson = new Dictionary<int, Ghost>();

    private int currentLevel;

    private int currentGhost;

    public float startTime = 0;

    public string previousScene = "";

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else if (Instance != this)
        {
            Destroy(this);
        }

        this.LoadAllConfigs();
    }

    private void LoadAllConfigs()
    {
        Levels levels = JsonUtility.FromJson<Levels>(levelConfig.text);
        Ghosts ghosts = JsonUtility.FromJson<Ghosts>(ghostConfig.text);

        for (int i = 0; i < levels.levels.Length; i++)
        {
            levelsInJson.Add(i + 1, levels.levels[i]);
        }
        for (int i = 0; i < ghosts.ghosts.Length; i++)
        {
            ghostsInJson.Add(i + 1, ghosts.ghosts[i]);
        }

        int level = PlayerPrefs.GetInt("level");
        currentLevel = level > 0 ? level : 1;

        currentGhost = PlayerPrefs.GetInt("ghost");
        currentGhost = currentGhost > 0 ? currentGhost : 1;
    }

    public void NextLevel()
    {
        currentLevel++;
        currentLevel = currentLevel >= levelsInJson.Count ? 1 : currentLevel;

        NextGhost();
        PlayerPrefs.SetInt("level", currentLevel);
    }

    public void NextGhost()
    {
        currentGhost++;
        currentGhost = currentGhost >= ghostsInJson.Count ? 1 : currentGhost;

        PlayerPrefs.SetInt("ghost", currentGhost);
    }

    public int GetCurrentLevel()
    {
        return currentLevel;
    }

    public Level GetLevelInfo(int level)
    {
        return levelsInJson[level];
    }

    public Ghost GetGhostInfo(int ghost)
    {
        return ghostsInJson[ghost];
    }

    public Level GetLevel()
    {
        return levelsInJson[currentLevel];
    }

    public int GetCurrentGhostIdx(){
        return currentGhost;
    }

    public Ghost GetCurrentGhost()
    {
        return ghostsInJson[currentGhost];
    }
}

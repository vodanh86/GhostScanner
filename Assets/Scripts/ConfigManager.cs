using System.Collections.Generic;
using UnityEngine; //

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConfigManager : MonoBehaviour
{
    public static ConfigManager Instance = null;

    public TextAsset levelConfig;

    public Dictionary<int, Level> levelsInJson = new Dictionary<int, Level>();

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
    }

    public Level GetLevel(int levelIdx)
    {
        return levelsInJson[levelIdx];
    }
}

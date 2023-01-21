using System.Collections;
using UnityEngine.SceneManagement;
using System.Collections.Generic;
using UnityEngine;

public class MenuManager : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        ConfigManager.Instance.GetLevel();
        Debug.Log(111);
    }

    // Update is called once per frame
    void Update() { }

    public void GoToScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }

    public void NextLevel()
    {
        ConfigManager.Instance.NextLevel();
        SceneManager.LoadScene(Constant.MAIN_SCENE_NAME);
    }
}

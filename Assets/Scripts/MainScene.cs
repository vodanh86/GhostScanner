using System.Collections;
using UnityEngine.SceneManagement;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class MainScene : MonoBehaviour
{
    // Start is called before the first frame update

    void Start()
    {
        int level = PlayerPrefs.GetInt("level");
        level = level > 0 ? level : 1;
        transform.Find("Level").GetComponent<TMP_Text>().text = "Level " + level;
        transform.Find("Ghost").GetComponent<TMP_Text>().text =
            "Ghost name: " + ConfigManager.Instance.GetLevel(level).name;
    }

    public void GoToScene(string sceneName)
    {
    Debug.Log(sceneName);
        SceneManager.LoadScene(sceneName);
        Debug.Log(123);
    }

    // Update is called once per frame
    void Update() { }
}

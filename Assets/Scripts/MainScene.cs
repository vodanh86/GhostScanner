using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;

public class MainScene : MonoBehaviour
{
    // Start is called before the first frame update

    void Start()
    {
        Time.timeScale = 1;
        string levelContent =
            "Level "
            + ConfigManager.Instance.GetLevel().name
            + "\n"
            + ConfigManager.Instance.GetLevel().levelName;
        ;
        transform.Find("Level").GetComponent<TMP_Text>().text = levelContent;
        transform.Find("Level").GetComponent<TypeWriterEffect>().SetFullText(levelContent);
        transform
            .Find("Level")
            .GetComponent<TypeWriterEffect>()
            .StartShowTextCoroutine(false, () => { });
        /*transform.Find("Ghost").GetComponent<TMP_Text>().text =
            "Ghost name: " + ConfigManager.Instance.GetLevel().ghostName;*/
        AsyncOperation async = SceneManager.LoadSceneAsync("GhostScanner", LoadSceneMode.Single);
        async.allowSceneActivation = false;
    }

    // Update is called once per frame
    void Update() { }
}

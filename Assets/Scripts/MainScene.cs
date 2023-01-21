using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class MainScene : MonoBehaviour
{
    // Start is called before the first frame update

    void Start()
    {
        transform.Find("Level").GetComponent<TMP_Text>().text =
            "Level " + ConfigManager.Instance.GetLevel().name;
        transform.Find("Ghost").GetComponent<TMP_Text>().text =
            "Ghost name: " + ConfigManager.Instance.GetLevel().ghostName;
    }

    // Update is called once per frame
    void Update() { }
}

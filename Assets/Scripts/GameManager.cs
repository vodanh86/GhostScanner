using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class GameManager : MonoBehaviour
{
    [SerializeField]
    private int minScanTime;

    [SerializeField]
    private int maxScanTime;

    [SerializeField]
    private int ghostRadius;
    private float scanTime;
    private float previousTime;

    [SerializeField]
    private AudioSource scream;

    [SerializeField]
    private AudioClip[] audioClips;

    [SerializeField]
    private GameObject ghost;

    [SerializeField]
    private GameObject flashImage;

    [SerializeField]
    private GameObject canvasResult;
    private GameObject ghostModel;
    private RadarController radarController;

    public event System.Action OnScanning;
    public event System.Action OnGhostFound;
    public event System.Action OnGhostHide;

    // Start is called before the first frame update
    void Start()
    {
        radarController = GameObject.FindWithTag("Radar").GetComponent<RadarController>();
        ghostModel = ghost.transform.Find(ConfigManager.Instance.GetLevel().name).gameObject;
        if (ghostModel == null)
        {
            ghostModel = ghost.transform.Find(Constant.DEFAUL_GHOST_MODEL).gameObject;
        }
        Time.timeScale = 1;
        for (int j = 0; j < ghost.transform.childCount; j++)
        {
            ghost.transform.GetChild(j).gameObject.SetActive(false);
        }
        OnGhostFound += ShowGhost;
        ResetScaner();
    }

    // Update is called once per frame
    void Update()
    {
        if (previousTime < scanTime && Time.time > scanTime)
        {
            OnGhostFound?.Invoke();
        }
        previousTime = Time.time;
    }

    void ShowGhost()
    {
        int direction = Random.Range(0, 2) * 2 - 1;
        radarController.SetGhostPostion(
            Random.Range(ghostRadius / 4, ghostRadius) * direction,
            Random.Range(ghostRadius / 4, ghostRadius)
        );
        StartCoroutine(EndJump());
    }

    IEnumerator EndJump()
    {
        yield return new WaitForSeconds(5.03f);
        ghostModel.SetActive(true);
        ghostModel.GetComponent<Animator>().SetBool("yelling", true);
        flashImage.SetActive(true);

        yield return new WaitForSeconds(1);
        if (ConfigManager.Instance.GetLevel().sex == "female")
        {
            scream.clip = audioClips[0];
        }
        else
        {
            scream.clip = audioClips[1];
        }
        scream.Play();
        
        yield return new WaitForSeconds(3.03f);
        ghostModel.SetActive(false);
        flashImage.SetActive(false);
        Time.timeScale = 0;
        canvasResult.SetActive(true);
        SaveCurrentTime();

        // show ghost description
        Transform ghostContent = canvasResult.transform.Find("[Text]GhostContent");
        string levelContent =
            "Level "
            + ConfigManager.Instance.GetLevel().name
            + "\n"
            + "You found: "
            + ConfigManager.Instance.GetLevel().ghostName;
        ;
        ghostContent.GetComponent<TMP_Text>().text = levelContent;
        ghostContent.GetComponent<TypeWriterEffect>().SetFullText(levelContent);
        ghostContent.GetComponent<TypeWriterEffect>().StartShowTextCoroutine();
        OnGhostHide?.Invoke();
    }

    void SaveCurrentTime()
    {
        string lastSavedGhosts = PlayerPrefs.GetString(Constant.PLAYER_PREFS_CATCH_TIME);
        lastSavedGhosts +=
            ConfigManager.Instance.GetCurrentLevel()
            + Constant.PLAYER_PREFS_SEPERATOR
            + System.DateTime.Now
            + Constant.PLAYER_PREFS_SEPERATOR;
        PlayerPrefs.SetString(Constant.PLAYER_PREFS_CATCH_TIME, lastSavedGhosts);
    }

    void ResetScaner()
    {
        scanTime = Time.time + Random.Range(minScanTime, maxScanTime);
        radarController.ClearGhost();
    }

    public void CatchGhost()
    {
        ResetScaner();
    }
}

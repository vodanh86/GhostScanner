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

    [SerializeField]
    private GameObject mainCamera;

    [SerializeField]
    private GameObject filterCamera;
    private float scanTime;
    private float previousTime;

    [SerializeField]
    private AudioSource scream;

    [SerializeField]
    private AudioClip[] audioClips;

    [SerializeField]
    private GameObject ghost;

    [SerializeField]
    private int foundTime;

    [SerializeField]
    private GameObject flashImage;

    [SerializeField]
    private GameObject textMessage;

    [SerializeField]
    private GameObject canvasResult;

    [SerializeField]
    private GameObject canvasEnergyWarning;

    [SerializeField]
    private GameObject energyBar;
    private GameObject ghostModel;
    private RadarController radarController;
    private ScanState scanState;
    public event System.Action OnScanning;
    public event System.Action OnGhostFound;
    public event System.Action OnGhostHide;

    private int count;

    void Awake()
    {
        Screen.sleepTimeout = SleepTimeout.NeverSleep;
    }

    // Start is called before the first frame update
    void Start()
    {
        count = 0;
        scanState = new ScanState();
        scanState.SetState((int)ScanState.State.SCANNING);
        radarController = GameObject.FindWithTag("Radar").GetComponent<RadarController>();
        ghostModel = ghost.transform.Find(ConfigManager.Instance.GetCurrentGhost().name).gameObject;
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
        if (Time.time > scanTime && scanState.GetState() == (int)ScanState.State.SCANNING)
        {
            count++;
            filterCamera.SetActive(true);
            mainCamera.SetActive(false);
            scanState.SetState((int)ScanState.State.FOUND);
            textMessage.GetComponent<TypeWriterEffect>().SetFullText("Signal Found");
            textMessage.GetComponent<TypeWriterEffect>().StartShowTextCoroutine(false);

            int direction = Random.Range(0, 2) * 2 - 1;
            radarController.SetGhostPostion(
                Random.Range(ghostRadius / 4, ghostRadius) * direction,
                Random.Range(ghostRadius / 4, ghostRadius)
            );
            StartCoroutine(HideGhost());

            if (count >= Random.Range(foundTime, foundTime * 2))
            {
                OnGhostFound?.Invoke();
            }
        }
    }

    IEnumerator HideGhost()
    {
        scream.clip = audioClips[2];
        scream.loop = true;
        scream.Play();
        yield return new WaitForSeconds(10);

        textMessage.GetComponent<TMP_Text>().text = "";
        scream.loop = false;
        scream.Stop();

        if (scanState.GetState() == (int)ScanState.State.FOUND)
        {
            textMessage.GetComponent<TypeWriterEffect>().SetFullText("Signal Lost");
            textMessage.GetComponent<TypeWriterEffect>().StartShowTextCoroutine(true);
        }

        StartCoroutine(ChangeState());
        mainCamera.SetActive(true);
        filterCamera.SetActive(false);

        ResetScaner();
    }

    IEnumerator ChangeState()
    {
        yield return new WaitForSeconds(5.03f);
        scanState.SetState((int)ScanState.State.SCANNING);
    }

    void ShowGhost()
    {
        scanState.SetState((int)ScanState.State.DONE);
        StartCoroutine(GhostJumps());
    }

    IEnumerator GhostJumps()
    {
        yield return new WaitForSeconds(5.03f);
        textMessage.GetComponent<TMP_Text>().text = "";
        flashImage.SetActive(true);
        ghostModel.SetActive(true);
        ghostModel.GetComponent<Animator>().SetInteger("action", 1);

        yield return new WaitForSeconds(10.03f);
        flashImage.SetActive(false);
        Time.timeScale = 0;
        canvasResult.SetActive(true);
        SaveCurrentTime();

        // show ghost description
        Transform ghostContent = canvasResult.transform.Find("[Text]GhostContent");
        Transform btnNextLevel = canvasResult.transform.Find("[Button]NextLevel");
        string levelContent =
            "You found: "
            + ConfigManager.Instance.GetCurrentGhost().ghostName
            + "\n"
            + "Click right button to continue scan more ghosts";
        ;
        ghostContent.GetComponent<TMP_Text>().text = levelContent;
        ghostContent.GetComponent<TypeWriterEffect>().SetFullText(levelContent);
        ghostContent.GetComponent<TypeWriterEffect>().StartShowTextCoroutine(false);
        btnNextLevel.GetComponent<EnableButton>().StartCountdown();
        OnGhostHide?.Invoke();
    }

    public void HideEnergyCanvas()
    {
        canvasEnergyWarning.SetActive(false);
        Time.timeScale = 1;
        energyBar.GetComponent<EnergyBar>().Charge();
        scanState.SetState((int)ScanState.State.CHARGING);
        StartCoroutine(ChangeState());
    }

    public void ShowEnergyWarning()
    {
        if (
            scanState.GetState() == (int)ScanState.State.SCANNING
            && textMessage.GetComponent<TMP_Text>().text == ""
        )
        {
            scanState.SetState((int)ScanState.State.WARNING);
            canvasEnergyWarning.SetActive(true);
            Time.timeScale = 0;
            Transform warningContent = canvasEnergyWarning.transform.Find("[Text]Description");
            warningContent
                .GetComponent<TypeWriterEffect>()
                .SetFullText(warningContent.GetComponent<TMP_Text>().text);
            warningContent.GetComponent<TypeWriterEffect>().StartShowTextCoroutine(false);
            canvasEnergyWarning.transform
                .Find("[Button]Reload")
                .GetComponent<EnableButton>()
                .StartCountdown();
        }
    }

    void SaveCurrentTime() { }

    public void ScanMore()
    {
        count = 0;
        Time.timeScale = 1;
        ghostModel.SetActive(false);
        ghostModel = ghost.transform.Find(ConfigManager.Instance.GetCurrentGhost().name).gameObject;
        ConfigManager.Instance.NextGhost();
        canvasResult.SetActive(false);
    }

    public int GetState()
    {
        return scanState.GetState();
    }

    void ResetScaner()
    {
        scanTime = Time.time + Random.Range(minScanTime, maxScanTime);
        previousTime = Time.time;
        radarController.ClearGhost();
    }

    public void CatchGhost()
    {
        ResetScaner();
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
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

    [SerializeField]
    private GameObject phoneCamera;
    private GameObject ghostModel;
    private RadarController radarController;
    private ScanState scanState;
    public event System.Action OnScanning;
    public event System.Action OnGhostFound;
    public event System.Action OnGhostHide;
    public event System.Action OnReScan;

    private int count;

    public static GameManager Instance { get; set; }
    public bool debug = false;
    public bool removeAds = false;

    void Awake()
    {
        Screen.sleepTimeout = SleepTimeout.NeverSleep;
    }

    // Start is called before the first frame update
    void Start()
    {
        if (AdManager.Ins.CheckHasRewardAds(true) && ConfigManager.Instance.previousScene == "Main")
        {
            AdManager.Ins.showInterstitialAds("CallAtEndGame");
        }
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

    public void RewardOfVideoAds() { }

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
            textMessage.GetComponent<TypeWriterEffect>().StartShowTextCoroutine(false, () => { });

            int direction = Random.Range(0, 2) * 2 - 1;
            radarController.SetGhostPostion(
                Random.Range(ghostRadius / 4, ghostRadius) * direction,
                Random.Range(ghostRadius / 4, ghostRadius)
            );

            if (count >= Random.Range(foundTime, foundTime * 2))
            {
                StartCoroutine(HideGhost(false));
                OnGhostFound?.Invoke();
            }
            else
            {
                StartCoroutine(HideGhost(true));
            }
        }
    }

    IEnumerator HideGhost(bool changeState)
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
            textMessage.GetComponent<TypeWriterEffect>().StartShowTextCoroutine(true, () => { });
        }

        if (changeState)
        {
            StartCoroutine(ChangeState());
        }
        mainCamera.SetActive(true);
        filterCamera.SetActive(false);

        ResetScaner();
    }

    IEnumerator ChangeState()
    {
        yield return new WaitForSeconds(5.03f);
        if (scanState.GetState() != (int)ScanState.State.DONE)
        {
            scanState.SetState((int)ScanState.State.SCANNING);
        }
    }

    void ShowGhost()
    {
        scanState.SetState((int)ScanState.State.DONE);
        StartCoroutine(GhostJumps());
    }

    IEnumerator GhostJumps()
    {
        scanState.SetState((int)ScanState.State.WARNING);
        yield return new WaitForSeconds(5.03f);
        textMessage.GetComponent<TMP_Text>().text = "";
        flashImage.SetActive(true);
        ghostModel.SetActive(true);
        ghostModel.GetComponent<Animator>().SetInteger("action", Random.Range(0, 4));

        yield return new WaitForSeconds(10.03f);
        flashImage.SetActive(false);
        Time.timeScale = 0;
        canvasResult.SetActive(true);
        SaveCurrentTime();
        string levelContent =
            "You found a ghost. \n There are some more around.\n Continue to scan ?";
        canvasResult.transform.Find("[Button]ScanMore").gameObject.SetActive(false);
        canvasResult.transform.Find("[Button]SaveCollection").gameObject.SetActive(false);
        canvasResult.transform.Find("[Button]NoThank").gameObject.SetActive(false);
        canvasResult.transform.Find("[Button]NextLevel").gameObject.SetActive(false);
        UpdateCanvasResult(levelContent, EnableNoThank);
        OnGhostHide?.Invoke();
    }

    private void UpdateCanvasResult(string message, System.Action callback)
    {
        // show ghost description
        Transform ghostContent = canvasResult.transform.Find("[Text]GhostContent");

        ghostContent.GetComponent<TMP_Text>().text = message;
        ghostContent.GetComponent<TypeWriterEffect>().SetFullText(message);
        ghostContent.GetComponent<TypeWriterEffect>().StartShowTextCoroutine(false, callback);
    }

    private void EnableNoThank()
    {
        canvasResult.transform.Find("[Button]ScanMore").gameObject.SetActive(true);
        StartCoroutine(ShowNoThank(canvasResult.transform.Find("[Button]NoThank")));
    }

    IEnumerator ShowNoThank(Transform transform)
    {
        yield return new WaitForSecondsRealtime(3);
        transform.gameObject.SetActive(true);
    }

    public void SaveModel()
    {
        string levelContent =
            "The ghost you found is "
            + ConfigManager.Instance.GetCurrentGhost().ghostName
            + ".\nDo you want to add the ghost into collection";
        ;
        canvasResult.transform.Find("[Button]ScanMore").gameObject.SetActive(false);
        canvasResult.transform.Find("[Button]SaveCollection").gameObject.SetActive(false);
        canvasResult.transform.Find("[Button]NoThank").gameObject.SetActive(false);
        canvasResult.transform.Find("[Button]NextLevel").gameObject.SetActive(false);
        UpdateCanvasResult(
            levelContent,
            () =>
            {
                canvasResult.transform.Find("[Button]SaveCollection").gameObject.SetActive(true);
                StartCoroutine(ShowNoThank(canvasResult.transform.Find("[Button]NextLevel")));
            }
        );
    }

    public void HideEnergyCanvas()
    {
        canvasEnergyWarning.SetActive(false);
        Time.timeScale = 1;
        energyBar.GetComponent<EnergyBar>().SetFuelSpeed(10f);
        energyBar.GetComponent<EnergyBar>().Charge(false);
        scanState.SetState((int)ScanState.State.CHARGING);
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
            warningContent
                .GetComponent<TypeWriterEffect>()
                .StartShowTextCoroutine(false, () => { });
            canvasEnergyWarning.transform
                .Find("[Text]CountDown")
                .GetComponent<EnableButton>()
                .StartCountdown(() => { });
        }
    }

    void SaveCurrentTime() { }

    public void ScanMore()
    {
        count = 0;
        OnReScan?.Invoke();
        Time.timeScale = 1;
        ghostModel.SetActive(false);
        Utils.SaveModel(ConfigManager.Instance.GetCurrentGhost().name, Constant.NOT_SAVED_MODEL);
        scanState.SetState((int)ScanState.State.SCANNING);
        ConfigManager.Instance.NextGhost();
        ghostModel = ghost.transform.Find(ConfigManager.Instance.GetCurrentGhost().name).gameObject;
        canvasResult.SetActive(false);
    }

    public int GetState()
    {
        return scanState.GetState();
    }

    public void SetState(int state)
    {
        scanState.SetState(state);
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

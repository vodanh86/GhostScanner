using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

public class PreloadScene : MonoBehaviour
{
    public float timeLoading = 7f;
    private float minPreloadValue = 0.2f;

    private float currentTime = 0f;
    private bool callLoadScene = false;

    public bool allowGoToSceneAfterLoad = false;

    [SerializeField]
    private string _sceneName = "Main";

    [SerializeField]
    private TextMeshProUGUI textLoadValue;
    public string _SceneName => this._sceneName;

    [HideInInspector]
    public bool finishAOA = true;

    public GameObject mycv;
    public GameObject mycam;

    [SerializeField]
    private UnityEngine.UI.Slider sliderBar;

    private AsyncOperation _asyncOperation;
    public GameObject light;

    private void LoadSceneAsyncProcess(string sceneName)
    {
        // Begin to load the Scene you have specified.
        //this._asyncOperation = SceneManager.LoadSceneAsync(sceneName,LoadSceneMode.Additive);
        // this._asyncOperation.allowSceneActivation = allowGoToSceneAfterLoad;
        //this._asyncOperation.allowSceneActivation = false;
    }

    private void Start()
    {
        //AdManager.Ins.ShowVideoAds("CallWhenStart ",LoadSceneNew);
        currentTime = 0f;
        //Invoke("LoadSceneNew",1f);
    }

    private void LoadSceneNew()
    {
        //LoadSceneAsyncProcess(_sceneName);
        SceneManager.LoadScene(_sceneName);
    }

    private void Update()
    {
        currentTime += Time.deltaTime;
        if (currentTime < timeLoading)
        {
            if (currentTime / timeLoading < minPreloadValue)
            {
                sliderBar.value = minPreloadValue;
            }
            else
            {
                var tempCurrentTime = currentTime / timeLoading;
                sliderBar.value = tempCurrentTime > 0.99f ? 0.99f : tempCurrentTime;
            }
            textLoadValue.text = "Loading..." + Mathf.Floor(sliderBar.value * 100) + "%";
        }
        else
        {
            currentTime = timeLoading;
            sliderBar.value = 1;
            if (!callLoadScene)
            {
                callLoadScene = true;
                GoToNextScene();
            }
        }
    }

    private void GoToNextScene()
    {
        Debug.Log("Try gotoNext Scene:" + finishAOA);

        if (true)
        {
            textLoadValue.text = "Loading..." + Mathf.Floor(sliderBar.value * 100) + "%";
            Debug.Log("Finish go to next Scene");
            LoadSceneNew();
        }
        else
        {
            Invoke("GoToNextScene", 1);
        }
    }
}

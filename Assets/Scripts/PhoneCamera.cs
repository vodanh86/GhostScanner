using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PhoneCamera : MonoBehaviour
{
    private bool camAvailable;
    private WebCamTexture backCam;

    [SerializeField]
    private GameObject defaultBackGround;

    [SerializeField]
    private Transform visualizer;

    [SerializeField]
    private Transform radar;

    [SerializeField]
    private GameObject camera;
    public GameObject background;
    public AspectRatioFitter fit;
    private float worldScreenHeight;
    private float worldScreenWidth;

    // Start is called before the first frame update
    void Start()
    {
        float planeToCameraDistance = Vector3.Distance(
            gameObject.transform.position,
            Camera.main.transform.position
        );
        worldScreenHeight =
            (2.0f * Mathf.Tan(0.5f * Camera.main.fieldOfView * Mathf.Deg2Rad))
            * planeToCameraDistance;
        worldScreenWidth = worldScreenHeight * Camera.main.aspect;

        background.transform.localScale = new Vector3(
            worldScreenHeight,
            worldScreenHeight,
            worldScreenHeight
        );

        WebCamDevice[] devices = WebCamTexture.devices;

        if (devices.Length == 0)
        {
            Debug.Log("No camera");
            camAvailable = false;
            return;
        }

        backCam = new WebCamTexture(devices[0].name, Screen.width, Screen.height);
        for (int i = 0; i < devices.Length; i++)
        {
            if (!devices[i].isFrontFacing)
            {
                backCam = new WebCamTexture(devices[i].name, Screen.width, Screen.height);
            }
        }

        if (backCam == null)
        {
            Debug.Log("Unable to find camera");
            return;
        }

        float screenHeight = Screen.height > Screen.width ? Screen.height : Screen.width;
        float screenWidth = Screen.height < Screen.width ? Screen.height : Screen.width;
        float camHeight = backCam.height > backCam.width ? backCam.height : backCam.width;
        float camWidth = backCam.height < backCam.width ? backCam.height : backCam.width;
        float margin = (screenHeight - screenWidth / camWidth * camHeight) / 2;

        if (margin > 0) { }

        backCam.Play();
        background.GetComponent<Renderer>().material.mainTexture = backCam;
        camAvailable = true;

        GameObject.FindWithTag("GameController").GetComponent<GameManager>().OnGhostHide +=
            PauseCamera;
        GameObject.FindWithTag("GameController").GetComponent<GameManager>().OnReScan += PlayCamera;
    }

    public void PlayCamera()
    {
        backCam.Play();
    }

    public void PauseCamera()
    {
        backCam.Pause();
    }

    // Update is called once per frame
    void Update()
    {
        if (!camAvailable)
        {
            return;
        }

        int orient = -backCam.videoRotationAngle;
        background.GetComponent<RectTransform>().localEulerAngles = new Vector3(0, 0, orient);

        float ratio = (float)backCam.height / (float)backCam.width;
        float scaleY = backCam.videoVerticallyMirrored ? -1 : 1f;
        float minScale =
            worldScreenHeight < worldScreenWidth ? worldScreenHeight : worldScreenWidth;
        float maxScale =
            worldScreenHeight > worldScreenWidth ? worldScreenHeight : worldScreenWidth;

        Vector3 screenPos = camera
            .GetComponent<Camera>()
            .WorldToScreenPoint(gameObject.transform.position);

        if (orient == 0)
        {
            background.GetComponent<RectTransform>().localScale = new Vector3(
                minScale / ratio,
                scaleY * minScale,
                1
            );
            defaultBackGround.GetComponent<RectTransform>().localScale = new Vector3(
                maxScale / ratio,
                scaleY * maxScale,
                1
            );

            /*Vector3 tmpPosition = visualizer.GetComponent<RectTransform>().anchoredPosition;
            visualizer.GetComponent<RectTransform>().anchoredPosition = new Vector3(
                tmpPosition.x,
                screenPos.y + 125 - gameObject.transform.localScale.y * 50,
                tmpPosition.z
            );
            tmpPosition = radar.GetComponent<RectTransform>().anchoredPosition;
            radar.GetComponent<RectTransform>().anchoredPosition = new Vector3(
                tmpPosition.x,
                screenPos.y + 200 - gameObject.transform.localScale.y * 50,
                tmpPosition.z
            );*/
        }
        else
        {
            background.GetComponent<RectTransform>().localScale = new Vector3(
                minScale / ratio,
                scaleY * minScale,
                1
            );
            defaultBackGround.GetComponent<RectTransform>().localScale = new Vector3(
                maxScale / ratio,
                scaleY * maxScale,
                1
            );

            /*Vector3 tmpPosition = visualizer.GetComponent<RectTransform>().anchoredPosition;
            visualizer.GetComponent<RectTransform>().anchoredPosition = new Vector3(
                tmpPosition.x,
                screenPos.y + 160 - gameObject.transform.localScale.x * 50,
                tmpPosition.z
            );
            tmpPosition = radar.GetComponent<RectTransform>().anchoredPosition;
            radar.GetComponent<RectTransform>().anchoredPosition = new Vector3(
                tmpPosition.x,
                screenPos.y + 240 - gameObject.transform.localScale.x * 50,
                tmpPosition.z
            );*/
        }
    }
}

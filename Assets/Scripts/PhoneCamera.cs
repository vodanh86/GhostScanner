using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PhoneCamera : MonoBehaviour
{
    private bool camAvailable;
    private WebCamTexture backCam;
    private Texture defaultBackGround;
    public GameObject background;
    public AspectRatioFitter fit;
    private float worldScreenHeight;
    private float worldScreenWidth;

    // Start is called before the first frame update
    void Start()
    {
        worldScreenHeight = Camera.main.orthographicSize * 2.0f;
        worldScreenWidth = (float)(worldScreenHeight / Screen.height * Screen.width);

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

        backCam.Play();
        background.GetComponent<Renderer>().material.mainTexture = backCam;
        camAvailable = true;

        GameObject.FindWithTag("GameController").GetComponent<GameManager>().OnGhostHide +=
            PauseCamera;
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

        if (orient == 0)
        {
            background.GetComponent<RectTransform>().localScale = new Vector3(
                worldScreenHeight / ratio,
                scaleY * worldScreenHeight,
                worldScreenHeight
            );
        }
        else
        {
            background.GetComponent<RectTransform>().localScale = new Vector3(
                worldScreenWidth / ratio,
                scaleY * worldScreenWidth,
                worldScreenWidth
            );
        }
    }
}

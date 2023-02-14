using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EnergyBar : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField]
    private float energy;

    [SerializeField]
    private GameObject gameManager;

    [SerializeField]
    private float fuelSpeed = 5f;

    [SerializeField]
    private float waitTime = 120f;

    [SerializeField]
    private AudioClip audioClip;

    [SerializeField]
    private GameObject canvasEnergyWarning;
    private AudioSource audioSource;
    private float startValue;
    private bool pauseTime = true;
    private int state = 0;

    void Start()
    {
        energy = ConfigManager.Instance.GetLevel().energy;
        ConfigManager.Instance.startTime = getTime();
        audioSource = new GameObject("[EnergyBar]AudioSource").AddComponent<AudioSource>();
        audioSource.loop = true;
        audioSource.clip = audioClip;
    }

    private float getTime()
    {
        if (pauseTime)
            return Time.unscaledTime;
        return Time.time;
    }

    public void SetFuelSpeed(float newFuelSpeed)
    {
        fuelSpeed = newFuelSpeed;
    }

    public void Charge(bool timeStatus)
    {
        audioSource.Play();
        state = -1;
        pauseTime = timeStatus;
        startValue = transform.Find("Fill Area").GetComponentInChildren<Slider>().value;
        ConfigManager.Instance.startTime = getTime();
    }

    // Update is called once per frame
    void Update()
    {
        if (state == 0)
        {
            float leftTime = 1f + (ConfigManager.Instance.startTime - getTime()) / energy;
            transform.Find("Fill Area").GetComponentInChildren<Slider>().value =
                leftTime < 0 ? 0 : leftTime;
            if (
                leftTime <= 0.01f
                && gameManager.GetComponent<GameManager>().GetState()
                    == (int)ScanState.State.SCANNING
            )
            {
                gameManager.GetComponent<GameManager>().ShowEnergyWarning();
                fuelSpeed = (getTime() - ConfigManager.Instance.startTime) / waitTime;
                Charge(true);
            }
        }
        else
        {
            float leftTime =
                startValue + (getTime() - ConfigManager.Instance.startTime) * fuelSpeed / energy;
            if (leftTime > 1)
            {
                audioSource.Stop();
                state = 0;
                gameManager.GetComponent<GameManager>().SetState((int)ScanState.State.SCANNING);
                Time.timeScale = 1;
                canvasEnergyWarning.SetActive(false);
                ConfigManager.Instance.startTime = getTime();
            }
            transform.Find("Fill Area").GetComponentInChildren<Slider>().value =
                leftTime > 1 ? 1 : leftTime;
        }
    }
}

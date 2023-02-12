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
    private int state = 0;

    void Start()
    {
        energy = ConfigManager.Instance.GetLevel().energy;

        audioSource = new GameObject("[EnergyBar]AudioSource").AddComponent<AudioSource>();
        audioSource.loop = true;
        audioSource.clip = audioClip;
    }

    public void SetFuelSpeed(float newFuelSpeed)
    {
        fuelSpeed = newFuelSpeed;
    }

    public void Charge()
    {
        audioSource.Play();
        state = -1;
        //startValue = 1f + (ConfigManager.Instance.startTime - Time.time) / energy;
        startValue = transform.Find("Fill Area").GetComponentInChildren<Slider>().value;
        ConfigManager.Instance.startTime = Time.time;
    }

    // Update is called once per frame
    void Update()
    {
        if (state == 0)
        {
            float leftTime = 1f + (ConfigManager.Instance.startTime - Time.time) / energy;
            transform.Find("Fill Area").GetComponentInChildren<Slider>().value =
                leftTime < 0 ? 0 : leftTime;
            if (
                leftTime <= 0.01f
                && gameManager.GetComponent<GameManager>().GetState()
                    == (int)ScanState.State.SCANNING
            )
            {
                gameManager.GetComponent<GameManager>().ShowEnergyWarning();
                fuelSpeed = (Time.time - ConfigManager.Instance.startTime) / waitTime;
                Charge();
            }
        }
        else
        {
            float leftTime =
                startValue
                + (Time.time - ConfigManager.Instance.startTime) * fuelSpeed / energy;
            if (leftTime > 1)
            {
                audioSource.Stop();
                state = 0;
                gameManager.GetComponent<GameManager>().SetState((int)ScanState.State.SCANNING);
                Time.timeScale = 1;
                canvasEnergyWarning.SetActive(false);
                ConfigManager.Instance.startTime = Time.time;
            }
            transform.Find("Fill Area").GetComponentInChildren<Slider>().value =
                leftTime > 1 ? 1 : leftTime;
        }
    }
}

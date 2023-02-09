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
    private AudioClip audioClip;

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

    public void Charge()
    {
        audioSource.Play();
        state = -1;
        startValue = 1f + (ConfigManager.Instance.startTime - Time.time) / energy;
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
                leftTime <= 0.1f
                && gameManager.GetComponent<GameManager>().GetState()
                    == (int)ScanState.State.SCANNING
            )
            {
                gameManager.GetComponent<GameManager>().ShowEnergyWarning();
            }
        }
        else
        {
            float leftTime =
                startValue + (Time.time - ConfigManager.Instance.startTime) * fuelSpeed / energy;
            if (leftTime > 1)
            {
                audioSource.Stop();
                state = 0;
                ConfigManager.Instance.startTime = Time.time;
            }
            transform.Find("Fill Area").GetComponentInChildren<Slider>().value =
                leftTime > 1 ? 1 : leftTime;
        }
    }
}

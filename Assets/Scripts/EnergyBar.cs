using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EnergyBar : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField]
    private float energy;

    void Start()
    {
        energy = ConfigManager.Instance.GetLevel().energy;
    }

    // Update is called once per frame
    void Update()
    {
        float leftTime = 1f - (Time.time - ConfigManager.Instance.startTime) / energy;
        transform.Find("Fill Area").GetComponentInChildren<Slider>().value =
            leftTime < 0 ? 0 : leftTime;
    }
}

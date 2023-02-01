using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class EnableButton : MonoBehaviour
{
    [SerializeField]
    int delayTime;

    [SerializeField]
    GameObject txtDelayTime;

    private bool started = false;
    private float startTime;

    // Start is called before the first frame update
    void Start() { }

    public void StartCountdown()
    {
        started = true;
        startTime = Time.unscaledTime;
    }

    // Update is called once per frame
    void Update()
    {
        if (started = true)
        {
            int leftTime = (int)(delayTime + startTime - Time.unscaledTime);
            if (leftTime > 0)
            {
                txtDelayTime.GetComponent<TMP_Text>().text = leftTime.ToString();
            }
            else
            {
                txtDelayTime.GetComponent<TMP_Text>().text = "";
                this.GetComponent<Button>().interactable = true;
            }
        }
        else
        {
            txtDelayTime.GetComponent<TMP_Text>().text = "";
        }
    }
}

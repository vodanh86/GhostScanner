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

    private System.Action callback;

    // Start is called before the first frame update
    void Start() { }

    public void StartCountdown(System.Action inputCallback)
    {
        started = true;
        startTime = Time.unscaledTime;
        callback = inputCallback;
    }

    // Update is called once per frame
    void Update()
    {
        if (started)
        {
            int leftTime = (int)(delayTime + startTime - Time.unscaledTime);
            if (leftTime > 0)
            {
                txtDelayTime.GetComponent<TMP_Text>().text = Utils.ConvertSecond(leftTime);
            }
            else
            {
                txtDelayTime.GetComponent<TMP_Text>().text = "";
                callback?.Invoke();
            }
        }
        else
        {
            txtDelayTime.GetComponent<TMP_Text>().text = "";
        }
    }
}

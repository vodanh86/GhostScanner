using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JumpTrigger : MonoBehaviour
{
    public AudioSource Scream;
    public GameObject Ghost;

    public GameObject JumpCam;
    public GameObject FlashImage;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(EndJump());
    }

    void OnTriggerEnter() { }

    // Update is called once per frame
    IEnumerator EndJump()
    {
        yield return new WaitForSeconds(5.03f);
        Scream.Play();
        //JumpCam.SetActive(true);
        Ghost.SetActive(true);
        FlashImage.SetActive(true);

        yield return new WaitForSeconds(3.03f);
        Ghost.SetActive(false);
        //JumpCam.SetActive(false);
        FlashImage.SetActive(false);
    }
}

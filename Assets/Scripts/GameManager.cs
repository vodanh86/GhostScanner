using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    [SerializeField]
    private int minScanTime;

    [SerializeField]
    private int maxScanTime;

    [SerializeField]
    private int ghostRadius;
    private float scanTime;
    private float previousTime;

    [SerializeField]
    private AudioSource scream;

    [SerializeField]
    private GameObject ghost;

    [SerializeField]
    private GameObject flashImage;

    [SerializeField]
    private GameObject canvasResult;
    private RadarController radarController;

    public event System.Action OnScanning;
    public event System.Action OnGhostFound;
    public event System.Action OnGhostHide;

    // Start is called before the first frame update
    void Start()
    {
        radarController = GameObject.FindWithTag("Radar").GetComponent<RadarController>();
        Time.timeScale = 1;
        ghost.SetActive(false);
        OnGhostFound += ShowGhost;
        ResetScaner();
    }

    // Update is called once per frame
    void Update()
    {
        if (previousTime < scanTime && Time.time > scanTime)
        {
            OnGhostFound?.Invoke();
        }
        previousTime = Time.time;
    }

    void ShowGhost()
    {
        int direction = Random.Range(0, 2) * 2 - 1;
        radarController.SetGhostPostion(
            Random.Range(ghostRadius / 4, ghostRadius) * direction,
            Random.Range(ghostRadius / 4, ghostRadius)
        );
        StartCoroutine(EndJump());
    }

    IEnumerator EndJump()
    {
        yield return new WaitForSeconds(5.03f);
        scream.Play();
        ghost.SetActive(true);
        flashImage.SetActive(true);

        yield return new WaitForSeconds(3.03f);
        ghost.SetActive(false);
        flashImage.SetActive(false);
        Time.timeScale = 0;
        canvasResult.SetActive(true);
        OnGhostHide?.Invoke();
    }

    void ResetScaner()
    {
        scanTime = Time.time + Random.Range(minScanTime, maxScanTime);
        radarController.ClearGhost();
    }

    public void CatchGhost()
    {
        ResetScaner();
    }
}

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
    private GameObject ghost;

    private RadarController radarController;

    public event System.Action OnScanning;
    public event System.Action OnGhostFound;

    // Start is called before the first frame update
    void Start()
    {
        radarController = GameObject.FindWithTag("Radar").GetComponent<RadarController>();
        ghost = GameObject.FindWithTag("Ghost");
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
        ghost.SetActive(true);
        int direction = Random.Range(0, 2) * 2 - 1;
        radarController.SetGhostPostion(
            Random.Range(ghostRadius / 4, ghostRadius) * direction,
            Random.Range(ghostRadius / 4, ghostRadius)
        );
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

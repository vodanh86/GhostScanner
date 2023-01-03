using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RadarController : MonoBehaviour
{
    [SerializeField]
    private Transform pfRadarPing;
    private Transform sweepTransform;
    private float rotationSpeed;
    private bool ghostFound;
    private float xAxis;
    private float yAxis;
    private bool pause;

    // Start is called before the first frame update
    void Start()
    {
        sweepTransform = transform.Find("Sweep");
        rotationSpeed = 180f;
        ghostFound = false;
        xAxis = 50f;
        yAxis = 50f;
    }

    // Update is called once per frame
    void Update()
    {
        float previousRotation = (sweepTransform.eulerAngles.z % 360) ;
        sweepTransform.eulerAngles -= new Vector3(0, 0, rotationSpeed * Time.deltaTime);
        float currentRotation = (sweepTransform.eulerAngles.z % 360) ;

        float angles = Mathf.Atan2(yAxis, xAxis) * Mathf.Rad2Deg;

        if (ghostFound && (previousRotation - angles) * (currentRotation - angles) < 0)
        {
            Transform radarPing = Instantiate(pfRadarPing, transform);
            radarPing.transform.localPosition = new Vector3(xAxis, yAxis, 0);
            radarPing.GetComponent<RadarPing>().SetColor(new Color(1, 0, 0));
            radarPing.GetComponent<RadarPing>().SetDisappearTimer(180f / rotationSpeed * 1f);
        }
    }

    public void ClearGhost()
    {
        ghostFound = false;
    }

    public void SetGhostPostion(float x, float y)
    {
        xAxis = x;
        yAxis = y;
        ghostFound = true;
    }
}

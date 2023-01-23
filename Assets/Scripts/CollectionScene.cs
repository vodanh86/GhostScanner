using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CollectionScene : MonoBehaviour
{
    public GameObject GhostInfor;
    public GameObject Content;

    // Start is called before the first frame update
    void Start()
    {
        for (int i = 0; i < ConfigManager.Instance.GetCurrentLevel(); i++)
        {
            GameObject ghost = Object.Instantiate(GhostInfor, Content.transform);
        }
    }

    // Update is called once per frame
    void Update() { }
}

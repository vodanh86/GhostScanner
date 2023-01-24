using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Level
{
    //these variables are case sensitive and must match the strings "firstName" and "lastName" in the JSON.
    public string name;
    public string ghostName;
    public string image;
    public string description;
}

[System.Serializable]
public class Levels
{
    //employees is case sensitive and must match the string "employees" in the JSON.
    public Level[] levels;
}

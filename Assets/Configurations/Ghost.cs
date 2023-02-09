using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Ghost
{
    //these variables are case sensitive and must match the strings "firstName" and "lastName" in the JSON.
    public string name;
    public string ghostName;
    public string image;
    public string description;
    public string sex;
}

[System.Serializable]
public class Ghosts
{
    //employees is case sensitive and must match the string "employees" in the JSON.
    public Ghost[] ghosts;
}

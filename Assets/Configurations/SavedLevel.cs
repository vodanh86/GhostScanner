using System.Collections;
using System.Collections.Generic;

[System.Serializable]
public class SavedLevel
{
    //these variables are case sensitive and must match the strings "firstName" and "lastName" in the JSON.
    public string catchedTime;
    public string catched;

    public SavedLevel(string inputCatchedTime, string inputCatched)
    {
        catchedTime = inputCatchedTime;
        catched = inputCatched;
    }
}

[System.Serializable]
public class SavedLevels
{
    //employees is case sensitive and must match the string "employees" in the JSON.
    public int count = 0;
    public Dictionary<string, SavedLevel> levels;
}

using UnityEngine;

public class ScanState
{
    public enum State
    {
        IDLE,
        SCANNING,
        WARNING,
        CHARGING,
        FOUND,
        DONE,
    }

    int state;

    public int GetState()
    {
        return state;
    }

    public void SetState(int state)
    {
        this.state = state;
    }
}

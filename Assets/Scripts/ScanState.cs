using UnityEngine;

public class ScanState
{
    public enum State
    {
        IDLE,
        SCANNING,
        WARNING,
        FOUND,
        DONE
    }

    int state;

    public int GetState()
    {
        return state;
    }

    public void SetState(int state)
    {
        Debug.Log(state);
        this.state = state;
    }
}

using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using TMPro;

public class TypeWriterEffect : MonoBehaviour
{
    [SerializeField]
    private float delay = 0.05f;

    private string fullText;
    private string currentText = "";

    [SerializeField]
    private AudioSource typingSound;

    private bool hideAtTheEnd;

        private System.Action callback;

    public void SetFullText(string levelContent)
    {
        fullText = levelContent;
    }

    // Use this for initialization
    public void StartShowTextCoroutine(bool hide, System.Action inputCallback)
    {
        hideAtTheEnd = hide;
        callback = inputCallback;
        StartCoroutine(ShowText());
    }

    IEnumerator ShowText()
    {
        for (int i = 1; i <= fullText.Length; i++)
        {
            currentText = fullText.Substring(0, i);
            this.GetComponent<TMP_Text>().text = currentText;
            typingSound.Play();
            yield return new WaitForSecondsRealtime(delay);
        }
        if (hideAtTheEnd)
        {
            yield return new WaitForSecondsRealtime(delay);
            this.GetComponent<TMP_Text>().text = "";
            yield return new WaitForSecondsRealtime(delay);
        }
        callback?.Invoke();
    }
}

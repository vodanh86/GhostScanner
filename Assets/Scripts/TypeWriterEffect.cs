using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using TMPro;

public class TypeWriterEffect : MonoBehaviour
{
    [SerializeField]
    private float delay = 0.1f;

    private string fullText;
    private string currentText = "";

    [SerializeField]
    private AudioSource typingSound;

    public void SetFullText(string levelContent)
    {
        fullText = levelContent;
    }

    // Use this for initialization
    public void StartShowTextCoroutine()
    {
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
    }
}

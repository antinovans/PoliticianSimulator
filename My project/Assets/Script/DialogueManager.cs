using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;

public class DialogueManager : MonoBehaviour
{
    [Header("Ink JSON")]
    [SerializeField]
    private TextAsset[] InkJSON;
    private int JSONIndex;
    [Header("Dialogue UI")]
    [SerializeField]
    private GameObject dialoguePanel;
    [SerializeField]
    private TextMeshProUGUI dialogueText;
    [Header("Choices UI")]
    [SerializeField]
    private GameObject[] choices;
    [Header("Switch Scene button")]
    [SerializeField]
    private GameObject switchScene;

    private TextMeshProUGUI[] choicesText;
    private static DialogueManager instance;

    private Story _currentStory;

    private bool _dialogueIsPlaying;
    private bool inChoiceMode;

    [Header("BGs")]
    [SerializeField]
    private GameObject BGImage1;
    [SerializeField]
    private GameObject BGImage2;

    [Header("Reporters")]
    [SerializeField]
    private GameObject Dave;
    [SerializeField]
    private GameObject John;

    //game stats
    bool bee = false;
    bool sock = false;
    bool crypid = false;
    bool car = false;
    bool microwave = false;
    bool congress = false;
    bool umami = false;
    int Influence = 10;
    int Money = 10;
    int Approval = 5;
    int Morale = 0;

    private void Awake()
    {
        if(instance != null)
        {
            Debug.Log("Found more than one Dialogue Manager");
        }
        instance = this;
    }

    public static DialogueManager GetInstance()
    {
        return instance;
    }
    
    private void Start()
    {
        JSONIndex = 0;
        
        _dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        inChoiceMode = false;

        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach(GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
        EnterDialogueMode(new Story(InkJSON[JSONIndex].text));
    }
    private void Update()
    {
        if (_dialogueIsPlaying == false)
        {
            return;
        }
        if (Input.GetMouseButtonDown(0) && inChoiceMode == false)
        {
            ContinueStory();
        }
/*        updateBG();*/
        updateImage();
    }

    public void EnterDialogueMode(Story input)
    {
        _currentStory = input;
        _dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);
        loadVariables();
        Bind();
        ContinueStory();
    }
    public void ExitDialogueMode()
    {
        _dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        dialogueText.text = "";
    }
    public void ContinueStory()
    {
        if (_currentStory.canContinue)
        {
            StopAllCoroutines();
            StartCoroutine(TypeSentence(_currentStory.Continue(), dialogueText));
            DisplayChoices();
        }
        else
        {
            ExitDialogueMode();
        }
    }
    private void DisplayChoices()
    {
        List<Choice> currentChoices = _currentStory.currentChoices;
        if(currentChoices.Count > 0)
        {
            inChoiceMode = true;
        }
        if(currentChoices.Count > choices.Length)
        {
            Debug.Log("Need more choice button");
        }

        int index = 0;
        foreach(Choice choice in currentChoices)
        {
            choices[index].SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }
        for(int i = index;i < choices.Length; i++)
        {
            choices[i].SetActive(false);
        }
    }
    public void MakeChoice(int choiceIndex)
    {
        _currentStory.ChooseChoiceIndex(choiceIndex);
        ContinueStory();
        inChoiceMode = false;
    }
    IEnumerator TypeSentence(string sentence, TextMeshProUGUI TextDisplay)
    {
        TextDisplay.text = "";
        foreach(char letter in sentence.ToCharArray())
        {
            TextDisplay.text += letter;
            yield return null;
        }
    }
    private void ChangeBG(int input)
    {

        if (input == 0)
        {
            BGImage1.SetActive(true);
            BGImage2.SetActive(false);
        }
        if(input == 1)
        {
            BGImage2.SetActive(true);
            BGImage1.SetActive(false);
        }
    }
    private void ChangeImage(GameObject obj, bool input)
    {

        if (input == true)
        {
            obj.SetActive(true);
        }
        else
        {
            obj.SetActive(false);
        }
    }
    private void updateBG()
    {
        _currentStory.ObserveVariable("background", (string varName, object newValue) => {
            ChangeBG((int)newValue);
        });
    }
    private void updateImage()
    {
        /*_currentStory.ObserveVariable("Dave", (string varName, object newValue) => {
            ChangeImage(Dave,(bool)newValue);
        });
        _currentStory.ObserveVariable("John", (string varName, object newValue) => {
            ChangeImage(John, (bool)newValue);
        });*/
        /*_currentStory.ObserveVariable("switch", (string varName, object newValue) => {
            ChangeImage(switchScene, (bool)newValue);
        });*/
    }
    public void switchChapter()
    {
        switchScene.SetActive(false);
        if (JSONIndex < InkJSON.Length)
        {
            saveVariables();
            JSONIndex++;
            EnterDialogueMode(new Story(InkJSON[JSONIndex].text));
        }
    }
    public void saveVariables()
    {
        bee = (bool)_currentStory.variablesState["bee"];
        sock = (bool)_currentStory.variablesState["sock"];
        crypid = (bool)_currentStory.variablesState["crypid"];
        car = (bool)_currentStory.variablesState["car"];
        microwave = (bool)_currentStory.variablesState["microwave"];
        congress = (bool)_currentStory.variablesState["congress"];
        Money = (int)_currentStory.variablesState["Money"];
        Influence = (int)_currentStory.variablesState["Influence"];
        Approval = (int)_currentStory.variablesState["Approval"];
        Morale = (int)_currentStory.variablesState["Morale"];
    }
    public void loadVariables()
    {
        _currentStory.variablesState["bee"] = bee;
        _currentStory.variablesState["sock"] = sock;
        _currentStory.variablesState["crypid"] = crypid;
        _currentStory.variablesState["car"] = car;
        _currentStory.variablesState["microwave"] = microwave;
        _currentStory.variablesState["congress"] = congress;
        _currentStory.variablesState["Money"] = Money;
        _currentStory.variablesState["Influence"] = Influence;
        _currentStory.variablesState["Approval"] = Approval;
        _currentStory.variablesState["Morale"] = Morale;
    }
    public void showToggle()
    {
        switchScene.SetActive(true);
        _dialogueIsPlaying = false;
    }

    public void Bind()
    {
        _currentStory.BindExternalFunction("showToggle", () => {
            showToggle();
        });
    }
}

using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Events;

public class QuestItems_Events : MonoBehaviour
{
    [System.Serializable]
    public class QuestItem
    {
        public GameObject itemObject;
        public UnityEvent onItemCollected;
    }

    public List<QuestItem> questItems;
    public UnityEvent onAllItemsCollected;
    public TextMeshProUGUI questLogText;

    public string questStartedMessage = "Quest started: Collect the items in order.";
    public string firstItemMessage = "First item to collect: {0}";
    public string allItemsCollectedMessage = "All quest items have already been collected.";
    public string itemCollectedMessage = "Collected: {0}";
    public string nextItemMessage = "Next item to collect: {0}";
    public string questCompleteMessage = "Quest complete! All items collected.";
    public string wrongItemMessage = "Wrong item. You need to collect: {0}";

    private int currentQuestIndex = 0;

    void Start()
    {
        if (questItems.Count > 0)
        {
            UpdateQuestLog(questStartedMessage);
            UpdateQuestLog(string.Format(firstItemMessage, questItems[currentQuestIndex].itemObject.name));
        }
        else
        {
            Debug.LogWarning("Quest items list is empty. Add items to the questItems list.");
        }
    }

    public void CollectItem(GameObject itemObject)
    {
        if (currentQuestIndex >= questItems.Count)
        {
            UpdateQuestLog(allItemsCollectedMessage);
            return;
        }

        if (questItems[currentQuestIndex].itemObject == itemObject)
        {
            UpdateQuestLog(string.Format(itemCollectedMessage, itemObject.name));
            questItems[currentQuestIndex].onItemCollected.Invoke();
            currentQuestIndex++;

            if (currentQuestIndex < questItems.Count)
            {
                UpdateQuestLog(string.Format(nextItemMessage, questItems[currentQuestIndex].itemObject.name));
            }
            else
            {
                UpdateQuestLog(questCompleteMessage);
                onAllItemsCollected.Invoke();
            }
        }
        else
        {
            UpdateQuestLog(string.Format(wrongItemMessage, questItems[currentQuestIndex].itemObject.name));
        }
    }

    private void UpdateQuestLog(string message)
    {
        if (questLogText != null)
        {
            questLogText.text = message;
        }
        else
        {
            Debug.LogWarning("Quest log TextMeshProUGUI is not assigned.");
        }
    }
}

using UnityEngine;
using UnityEngine.Events;

// This script works specifically with the Highscore_Events script... Make sure you have it too!!
// This script works also specifically with the HealthEvents script - make sure you have it too as well!!

public class CollectingScript : MonoBehaviour
{
    public string playerTag = "Player";
    public string collectorTag = "Collector";   
    public bool destroyAfterTrigger = true;
    public bool destroyAfterTime = true;
    public float destroyDelay = 5f;
    public bool givesScore = true;
    public bool givesDamage = false;
    public bool givesHealth = false;

    private bool hasCollected = false;

    public UnityEvent onTriggerEnterEvent;

    void OnTriggerEnter(Collider other)
    {
        if (!hasCollected && other.CompareTag(playerTag))
        {
            GameObject collector = GameObject.FindGameObjectWithTag(collectorTag);
            if (collector != null)
            {
                Highscore_Events highScoreEvents = collector.GetComponent<Highscore_Events>();
                if (highScoreEvents != null && givesScore == true && givesDamage == false)
                {
                    highScoreEvents.Invoke("Collecting", 0f);
                }
                
                HealthEvents healthEvents = collector.GetComponent<HealthEvents>();
                if (healthEvents != null && givesDamage == true)
                {
                    healthEvents.Invoke("TakeDamage", 0f);
                }                
                if (healthEvents != null && givesHealth == true)
                {
                    healthEvents.Invoke("TakeHeal", 0f);
                }
            }

            // Invoke UnityEvent
            onTriggerEnterEvent.Invoke();

            // Ensure collecting happens only once
            hasCollected = true;

            if (destroyAfterTrigger)
            {
                DestroyObject();
            }
        }
    }

    void Start()
    {
        if (destroyAfterTime)
        {
            Destroy(gameObject, destroyDelay);
        }
    }

    void DestroyObject()
    {
        // Destroy the object immediately
        Destroy(gameObject);
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class HealthEvents : MonoBehaviour
{
    public float currentHealth = 100f;    
    public float damageAmount = 25f;
    public float healAmount = 25f;
    public Slider healthSlider;
    public UnityEvent OnDamage;
    public UnityEvent onHeal;
    public UnityEvent HealthReachedZero;
    public float secondEventTimeDelayed;
    public UnityEvent secondEvent_HealthReachedZero;

    private void Start()
    {
        healthSlider.maxValue = currentHealth;
        healthSlider.minValue = 0f;
        healthSlider.value = currentHealth;
    }

    private void Update()
    {
        if (currentHealth <= 0f)
        {
            currentHealth = 0f;
            HealthReachedZero.Invoke();
            StartCoroutine("SecondEventDelay");
        }
        if (currentHealth >= healthSlider.maxValue)
        {
            currentHealth = healthSlider.maxValue;
        }
    }

    public void TakeDamage()
    {
        healthSlider.value = currentHealth -= damageAmount;
        OnDamage.Invoke();
    }

    public void TakeHeal()
    {
        healthSlider.value = currentHealth += healAmount;
        onHeal.Invoke();
    }

    IEnumerator SecondEventDelay()
    {
        yield return new WaitForSeconds(secondEventTimeDelayed);

        secondEvent_HealthReachedZero.Invoke();

    }
}

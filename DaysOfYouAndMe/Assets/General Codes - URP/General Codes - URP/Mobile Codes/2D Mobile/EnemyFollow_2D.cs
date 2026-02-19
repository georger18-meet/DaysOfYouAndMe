using UnityEngine;
using System.Collections.Generic;
using System.Collections;

public class EnemyFollow_2D : MonoBehaviour
{
    public string playerTag = "Player";
    public float followRadius = 5f;
    public float stopRadius = 0.5f;
    public float speed = 2f;
    public LayerMask obstacleLayer;
    public List<Transform> patrolPoints;
    public List<float> patrolDelays;

    private Transform playerTransform;
    private CircleCollider2D enemyCollider;
    private int currentPatrolIndex = 0;
    //private bool isChasing = false;
    private bool isWaiting = false;

    void Start()
    {
        GameObject player = GameObject.FindGameObjectWithTag(playerTag);
        if (player != null)
        {
            playerTransform = player.transform;
        }
        enemyCollider = GetComponent<CircleCollider2D>();
        if (enemyCollider == null)
        {
            enemyCollider = gameObject.AddComponent<CircleCollider2D>();
        }
        enemyCollider.isTrigger = true;
    }

    void Update()
    {
        if (playerTransform == null || patrolPoints.Count == 0)
            return;

        float distanceToPlayer = Vector2.Distance(transform.position, playerTransform.position);

        if (distanceToPlayer < followRadius)
        {
            //isChasing = true;
            StopCoroutine(PatrolDelay());
            FollowPlayer();
        }
        else
        {
            if (!isWaiting)
            {
                //isChasing = false;
                Patrol();
            }
        }
    }

    void FollowPlayer()
    {
        if (Vector2.Distance(transform.position, playerTransform.position) > stopRadius)
        {
            MoveTowards(playerTransform.position);
        }
    }

    void Patrol()
    {
        if (patrolPoints.Count == 0 || isWaiting)
            return;

        Transform targetPoint = patrolPoints[currentPatrolIndex];
        if (Vector2.Distance(transform.position, targetPoint.position) < 0.1f)
        {
            StartCoroutine(PatrolDelay());
        }
        else
        {
            MoveTowards(targetPoint.position);
        }
    }

    IEnumerator PatrolDelay()
    {
        isWaiting = true;
        float waitTime = (patrolDelays.Count > currentPatrolIndex) ? patrolDelays[currentPatrolIndex] : 0f;
        yield return new WaitForSeconds(waitTime);
        currentPatrolIndex = (currentPatrolIndex + 1) % patrolPoints.Count;
        isWaiting = false;
    }

    void MoveTowards(Vector2 targetPosition)
    {
        Vector2 direction = (targetPosition - (Vector2)transform.position).normalized;
        Vector2 movement = direction * speed * Time.deltaTime;

        Collider2D[] hits = new Collider2D[5];
        ContactFilter2D filter = new ContactFilter2D();
        filter.SetLayerMask(obstacleLayer);
        int numHits = Physics2D.OverlapCircle((Vector2)transform.position + movement, enemyCollider.radius, filter, hits);

        if (numHits == 0)
        {
            transform.Translate(movement);
        }
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, followRadius);
        Gizmos.color = Color.green;
        Gizmos.DrawWireSphere(transform.position, stopRadius);

        if (patrolPoints != null && patrolPoints.Count > 0)
        {
            Gizmos.color = Color.blue;
            for (int i = 0; i < patrolPoints.Count; i++)
            {
                Gizmos.DrawSphere(patrolPoints[i].position, 0.2f);
                if (i < patrolPoints.Count - 1)
                {
                    Gizmos.DrawLine(patrolPoints[i].position, patrolPoints[i + 1].position);
                }
                else
                {
                    Gizmos.DrawLine(patrolPoints[i].position, patrolPoints[0].position);
                }
            }
        }
    }
}

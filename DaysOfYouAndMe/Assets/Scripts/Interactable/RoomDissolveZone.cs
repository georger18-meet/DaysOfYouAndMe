using UnityEngine;

public class RoomDissolveZone : MonoBehaviour
{
    [SerializeField] private DissolveGroup dissolveGroup;

    private void Reset()
    {
        // Try auto-find in parent/children if you forget
        if (dissolveGroup == null)
            dissolveGroup = GetComponentInParent<DissolveGroup>();
    }

    private void OnTriggerEnter(Collider other)
    {
        var player = other.GetComponentInParent<PlayerController>();
        if (player == null) return;

        player.SetActiveDissolveGroup(dissolveGroup);
    }

    private void OnTriggerExit(Collider other)
    {
        var player = other.GetComponentInParent<PlayerController>();
        if (player == null) return;

        // Only clear if THIS zone was the active one
        player.ClearActiveDissolveGroup(dissolveGroup);
    }
}

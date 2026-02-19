using UnityEngine;

    public class Respawnablee : MonoBehaviour
    {
        private Vector3 _position;
        private Rigidbody _rigidbody;
        public int maxfalling = -50;
    
        void Start()
        {
            _position = transform.position;
            _rigidbody = GetComponent<Rigidbody>();
        }
    
    
        void Update()
        {
            if( transform.position.y < maxfalling)
                Respawn();
        }
    
    
        private void Respawn()
        {
            _rigidbody.linearVelocity = new Vector3( 0, _rigidbody.linearVelocity.y, 0 );
            transform.position = _position + Vector3.up * 1f;
        }
    }

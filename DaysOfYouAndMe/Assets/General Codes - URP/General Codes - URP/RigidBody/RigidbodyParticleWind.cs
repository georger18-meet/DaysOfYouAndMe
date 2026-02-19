using UnityEngine;

[RequireComponent(typeof(ParticleSystem))]
public class RigidbodyParticleWind : MonoBehaviour
{
    ParticleSystem particlesSystem;
    ParticleSystem.Particle[] particles;
    Rigidbody myRigidbody;

    void Start()
    {
        particlesSystem = gameObject.GetComponent<ParticleSystem>();
        particles = new ParticleSystem.Particle[1];
        SetupParticleSystem();
        myRigidbody = gameObject.GetComponent<Rigidbody>();
    }

    void FixedUpdate()
    {
        particlesSystem.GetParticles(particles);

        myRigidbody.linearVelocity += particles[0].velocity;
        particles[0].position = myRigidbody.position;
        particles[0].velocity = Vector3.zero;

        particlesSystem.SetParticles(particles, 1);
    }

    void SetupParticleSystem()
    {
        var main = particlesSystem.main;
        main.startLifetime = Mathf.Infinity;
        main.startSpeed = 0;
        main.simulationSpace = ParticleSystemSimulationSpace.World;
        main.maxParticles = 1;

        var emission = particlesSystem.emission;
        emission.rateOverTime = 1; // Use rateOverTime instead of emissionRate

        // Note: You still need to manually enable "External Forces" and disable "Renderer"

        // Start the particle at the center
        particlesSystem.Emit(1);
        particlesSystem.GetParticles(particles);
        particles[0].position = Vector3.zero;
        particlesSystem.SetParticles(particles, 1);
    }
}

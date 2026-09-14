class Emitter {
  PVector position;
  int particleRate;
  int lastParticleTime;
  int maxParticles;
  ArrayList<Particle> particles;

  Emitter(PVector l, int rate, int maxPar) {
    position = l.copy();
    particleRate = rate;
    lastParticleTime = 0;
    maxParticles = maxPar;
    particles = new ArrayList<Particle>();
  }

  void update(PVector force, Player player) {
    
    if (millis() - lastParticleTime > particleRate && particles.size() < maxParticles) {
      lastParticleTime = millis();
      particles.add(new Particle(position));
    }

    applyForce(force, player);
  }
  
  void applyForce(PVector force, Player player) {
    for (Particle p : particles) {
      PVector playerAttraction = p.attractForce(player);
      PVector totalForce = force.copy().add(playerAttraction);
      p.applyForce(totalForce);
      p.update(position);
    }
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
}

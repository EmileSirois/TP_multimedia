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

  void update(PVector force) {
    if (millis() - lastParticleTime > particleRate && particles.size() < maxParticles) {
      lastParticleTime = millis();
      particles.add(new Particle(position));
    }

    applyForce(force);
  }
  
 void applyForce(PVector force) {
    for (Particle p : particles) {
      p.applyForce(force);
      p.update(position);
    }
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
}

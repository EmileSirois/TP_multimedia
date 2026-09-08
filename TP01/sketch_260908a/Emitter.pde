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

  void update(int deltaTime) {
    if (millis() - lastParticleTime > particleRate && particles.size() < maxParticles) {
      lastParticleTime = millis();
      particles.add(new Particle(position));
    }

    for (Particle p : particles) {
      p.update(position.copy());
    }
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector emitterPosition;
  float lifespan;

  Particle() {
    initialize();
  }

  Particle(PVector l) {
    position = l.copy();
    initialize();
  }

  void initialize() {
    velocity = new PVector(random(-1, 1), random(-2, 0));
    acceleration = new PVector(0, 0.05);
    lifespan = 255;
  }

  void update(PVector ep) {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;

    if(isDead()) {
      reset(ep);
    }
  }

  void display() {
    stroke(0, lifespan);
    fill(0, 0, 255, lifespan);
    ellipse(position.x, position.y, 10, 10);
  }

  boolean isDead() {
    return lifespan < 0.0;
  }

  void reset(PVector ep) {
    position.set (ep);
    velocity.set (random(-1, 1), random(-2, 0));    
    lifespan = 255;
  }
}

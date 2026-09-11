class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector emitterPosition;
  float lifespan;
  int mass;

  Particle() {
    initialize();
  }

  Particle(PVector l) {
    position = l.copy();
    initialize();
  }

  void initialize() {
    velocity = new PVector(random(-1, 1), random(-2, 0));
    acceleration = new PVector(0, 0);
    lifespan = 255;
    mass = 1;
  }

  void update(PVector ep) {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;

    if(isDead()) {
      reset(ep);
    }
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(this.mass);

    acceleration.add(f);
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
    acceleration.set (0, 0);
    position.set (ep);
    velocity.set (random(-1, 1), random(-2, 0));    
    lifespan = 255;
  }
}

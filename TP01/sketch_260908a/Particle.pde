class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector emitterPosition;
  float lifespan;
  int mass;
  boolean isAttracted = false;

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

  PVector attractForce(Player player) {
    PVector force = player.position.copy().sub(position);
    float distance = force.mag();

    isAttracted = distance < player.attractionDistance;

    if (!isAttracted) {
      return new PVector(0, 0);
    }

    float G = 1000; // constante de force arbitraire
    float strength = G * (player.mass * this.mass) / (distance * distance);
    force.setMag(strength);

    return force;
  }

  void display() {
    stroke(0, lifespan);
    if (isAttracted) {
      fill(255, 0, 0, lifespan); 
    } else {
      fill(0, 0, 255, lifespan);
    }
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
    isAttracted = false;
  }
}

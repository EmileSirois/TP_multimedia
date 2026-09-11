int currentTime;
int deltaTime;
int previousTime;
PVector gravity = new PVector(0, 0.01);

Emitter emitter;

void setup() {
  size(800, 600);
  emitter = new Emitter (new PVector( width / 2, (height / 4)*3), 20, 400);
}

void draw() {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;

  update(deltaTime);
  display();
}

void update(int deltaTime) {
  emitter.update(gravity);
}

void display() {
  background(255);

  emitter.display();
}

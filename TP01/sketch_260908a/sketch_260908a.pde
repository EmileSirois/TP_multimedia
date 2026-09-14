int currentTime;
int deltaTime;
int previousTime;
PVector gravity = new PVector(0, 0.01);

Emitter emitter;
Player player;

void setup() {
  size(800, 600);
  emitter = new Emitter (new PVector( width / 2, (height / 4)*3), 20, 400);
  player = new Player (new PVector(0, 570));
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
  player.display();
}

void keyPressed() {
  if(key == 'a'){
    player.moveLeft();
  }
  else if(key == 'd'){
    player.moveRight();
  }
}

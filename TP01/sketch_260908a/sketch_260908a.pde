int currentTime;
int deltaTime;
int previousTime;
color background = 255;
PVector gravity = new PVector(0, 0.01);

Emitter emitter;
Player player;

void setup() {
  size(800, 600);
  player = new Player (new PVector(0, 570));
  emitter = new Emitter (new PVector( width / 2, (height / 4)*3), 20, 400);
}

void draw() {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;
  
  if(keyPressed && key == 'a'){
    player.setVelo(new PVector(-5,0));
  }
  if(keyPressed && key == 'd'){
    player.setVelo(new PVector(5, 0));
  }
  if(!keyPressed){
    player.setVelo(new PVector(0, 0));
  }
  
  update(deltaTime);
  display();
}

void update(int deltaTime) {
  emitter.update(gravity, player);
  player.update();
}

void display() {
  background(background);
  
  text(key, 10, 10);

  emitter.display();
  player.display();
}

void setDistance(int distance) {
  player.changeAttractionDistance(distance);
}
  

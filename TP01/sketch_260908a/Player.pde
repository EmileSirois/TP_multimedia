class Player {
  PVector position;
  PVector velocity;
  int mass = 1;
  int attractionDistance;
  int baseAttDis = 100;
  
  Player(PVector initialPos){
    position = initialPos.copy();
    velocity = new PVector(0, 0);
    attractionDistance = baseAttDis;
  }
  
  void changeAttractionDistance(int newDis){
    attractionDistance = newDis;
  }
  
  void setVelo(PVector newVelo){
    velocity = newVelo.copy();
  }
  
  void update(){
    position = position.add(velocity);
    
  }
  
  void display(){
    fill(125);
    square(position.x, position.y, 30);
  }
}

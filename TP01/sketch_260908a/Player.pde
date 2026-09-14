class Player {
  PVector position;
  PVector velocity;
  
  Player(PVector initialPos){
    position = initialPos.copy();
  }
  
  void moveRight(){
  }
  
  void moveLeft(){
  }
  
  void display(){
    fill(125);
    square(position.x, position.y, 30);
  }
}

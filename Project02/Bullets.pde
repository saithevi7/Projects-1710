// https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery03/Bullet.pde
class Bullets {
  
  PVector pos;
  float clockwise;
  int timeStamp;
  float speed = 10;
  float offset = 50;
  boolean present = true;
  int timePresent = 1000;
  
  Bullets(float x, float y, float _clockwise) {
    pos = new PVector(x, y);
    clockwise = _clockwise;
    timePresent = millis();
    newPos(offset);
  }
  
  // https://www.emanueleferonato.com/2007/04/28/create-a-flash-artillery-game-step-1/
  void newPos(float _speed) {
    pos.x += _speed * sin(radians(clockwise));
    pos.y += _speed * cos(radians(clockwise));
  }
  
  void update() {
    newPos(speed);
    
  }
    
  void draw() { // draw bullets
    stroke(255);
    fill(0);
    rect(pos.x, pos.y, 15, 8);
  }
  
  void run() {
    update();
    draw();
  }
}

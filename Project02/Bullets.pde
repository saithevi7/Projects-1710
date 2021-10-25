class Bullets {
  
  PVector pos;
  float lifeSpan;
  int timeStamp;
  float speed = 10;
  float offset = 50;
  boolean present = true;
  int timePresent = 1500;
  
  Bullets(float x, float y, float _lifeSpan) {
    pos = new PVector(x, y);
    lifeSpan = _lifeSpan;
    timePresent = millis();
    newPosition(offset);
  }
  
  // https://www.emanueleferonato.com/2007/04/28/create-a-flash-artillery-game-step-1/
  void newPosition(float _speed) {
    pos.x += _speed * sin(radians(lifeSpan));
    pos.x += _speed * cos(radians(lifeSpan));
  }
  
  void update() {
    newPosition(speed);
    
    if (present && millis() > timeStamp + timePresent) {
      present = false;
    }
  }
    
  void draw() {
    fill(255);
    rect(pos.x, pos.y, 15, 8);
  }
  
  void run() {
    update();
    draw();
  }
}

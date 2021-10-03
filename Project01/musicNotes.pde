class musicNotes {
  
  PVector position;
  boolean appear = true;
  
  musicNotes(float x, float y) {
    position = new PVector(x, y);
  }
     
  void update() {
  }
  
  void draw() {
    if(appear) {
      ellipseMode(CENTER);
      fill(0);
      ellipse(position.x, position.y, 30, 30);
      
      fill(0);
      rect(position.x+4.5, position.y-55, 10, 60);
      
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}

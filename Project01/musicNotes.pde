class musicNotes {
  
  PImage EighthNotes;
  PVector position;
  boolean appear = true;
  
  musicNotes(float x, float y) {
    position = new PVector(x, y);
  }
     
  void setup() {
    EighthNotes = loadImage("musicNote.png");
  }
  
  void update() {
  }
  
  void draw() {
    if(appear) {
      image(EighthNotes, position.x, position.y, 50, 50);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}

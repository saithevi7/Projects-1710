class musicNotes {
  
  PImage musicNotes;
  PVector position;
  boolean appear = true;
  
  musicNotes(float x, float y) {
    position = new PVector(x, y);
  }
   
  
  void setup() {
    musicNotes = loadImage("musicNote.png");
  }
  
  void update() {
  }
  
  void draw() {
    if(appear) {
      image(musicNotes, position.x, position.y, 50, 50);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}

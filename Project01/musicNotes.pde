class musicNotes {
  
  PImage musicNotes;
  PVector position;
  boolean appear = true;
  
  musicNotes(float x, float y) {
   position = new PVector(x, y);
  }
  
  void update() {
  }
  
  void setup() {
    musicNotes = loadImage("musicNote.png");
    musicNotes.resize(musicNotes.width/2, musicNotes.height/2);
  }
  
  
  void draw() {
    if(appear) {
      image(musicNotes, position.x, position.y);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}

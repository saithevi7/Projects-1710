class Deemo {

  PVector position, target;
  PImage currentDeemo, deemo, deemoLeftside, deemoRightside;
  int findNotes;
  
  boolean move = false;
  int moveMarkTime = 0;
  int moveTimeOut = 2200; 
   
  boolean searching = false;
  
  float triggerDistance1 = 70;
  float triggerDistance2 = 40;
    
  // Constructor
  Deemo(float x, float y) {
    position = new PVector(x, y);
    pickNoteFind();
    
    deemo = loadImage("deemo.png");
    deemo.resize(deemo.width/2, deemo.height/2);
    
    deemoLeftside = loadImage("deemoLeftside.png");
    deemoLeftside.resize(deemoLeftside.width/3, deemoLeftside.height/3);
    
    deemoRightside = loadImage("deemoRightside.png");
    deemoRightside.resize(deemoRightside.width/3, deemoRightside.height/3);

    
    currentDeemo = deemo;
  }
  
  void update() {
    PVector mousePos = new PVector(mouseX, mouseY);
    move = position.dist(mousePos) < triggerDistance1;
    
    if (move) {
      searching = false;
      moveMarkTime = millis();
      currentDeemo = deemoLeftside; 
      if (position.dist(target) < triggerDistance2) {
        pickNoteFind();
      }
      // nothing happens, then search for target
      if (!searching) {
        noteTarget();
        searching = true;
      }
      else if (!move && millis() > moveMarkTime + moveTimeOut/2) {
       currentDeemo = deemo; // neutral expression
    }
  }
  
    // delay in gaining the note to give more of a "ghostly" feeling
    if (move || searching) {
      position = position.lerp(target, 0.08).add(new PVector(random(-1, 2), random(-1, 2)));
    }
    
    if (searching && position.dist(target) < 5) {
      notes[findNotes].appear = false; 
      noteTarget();
    }
    
    position.y += tan(millis()) / 2;
    position.x += sin(millis()) / 2;
  }
  
  void draw() {    
    imageMode(CENTER);
  
    image(currentDeemo, position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }
  
  void pickNoteFind() {
    target = new PVector(random(50, width-50), random(50, height-50));
  }
  
  void noteTarget() {
    findNotes = int(random(notes.length));
    if (notes[findNotes].appear) {
      target = notes[findNotes].position;
    }
  }
  
}

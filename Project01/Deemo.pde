/*
Class for the character Deemo
This setup was inspired from Nick Fox-Gieg's repo from Week04, Creature03, Steve
https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde 
*/

class Deemo {

  // variables 
  PVector position, target;
  PImage currentDeemo, deemo, deemoLeftside, inverseDeemo;
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
    noteSearch();
    
    deemo = loadImage("deemo.png");
    deemo.resize(deemo.width/2, deemo.height/2);
    
    deemoLeftside = loadImage("deemoLeftside.png");
    deemoLeftside.resize(deemoLeftside.width/3, deemoLeftside.height/3);
        
    inverseDeemo = loadImage("white_Deemo.png");
    inverseDeemo.resize(inverseDeemo.width/2, inverseDeemo.height/2);
          
    currentDeemo = deemo;
  }
  
  // interactions 
  void update() {
    PVector mousePos = new PVector(mouseX, mouseY);
    move = position.dist(mousePos) < triggerDistance1;
    
    // if interaction, then move
    if (move) { 
      searching = false;
      moveMarkTime = millis();
      currentDeemo = deemoLeftside; 
      if (position.dist(target) < triggerDistance2) {
        noteSearch();
      }
      
      // no interaction, then search for note
      if (!searching) { 
        noteTarget();
        searching = true;
        currentDeemo = deemoLeftside; 
      }     
  }
  
    // delay in gaining the note to give more of a "ghostly" feeling
    if (move || searching) {
      position = position.lerp(target, 0.08).add(new PVector(random(-1, 2), random(-1, 2)));
    }
    
    // if move, new background and image
    if (notes[findNotes].appear == false) {
      background(0);
      currentDeemo = inverseDeemo;
    }
    
    // search for note
    if (searching && position.dist(target) < 5) {
      notes[findNotes].appear = false; 
      noteTarget();
    }
    
    // movement that gives the character a "glitchy" look
    position.y += tan(millis()) / 2;
    position.x += sin(millis()) / 2;
  }
  
  // current deemo image
  void draw() {    
    imageMode(CENTER);
  
    image(currentDeemo, position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }
  
  // randomly search note
  void noteSearch() {
    target = new PVector(random(50, width-50), random(50, height-50));
  }
  
  // array for note, if appear true (always)
  void noteTarget() {
    findNotes = int(random(notes.length));
    if (notes[findNotes].appear) {
      target = notes[findNotes].position;
    }
  }
   
}

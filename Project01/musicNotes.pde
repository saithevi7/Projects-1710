/*
Class for the character Music Notes
This setup was inspired from Nick Fox-Gieg's repo from Week04, Creature03, Food
https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Food.pde
*/

// music notes class
class musicNotes {
  
  // variables 
  PVector position;  
  boolean appear = true;
  
  // contructor
  musicNotes(float x, float y) {
    position = new PVector(x, y);
  }
     
  void update() { 
  }
  
  // music note
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

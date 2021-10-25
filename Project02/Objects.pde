// https://forum.processing.org/two/discussion/12240/spawning-objects-using-timers

class Objects {
  PVector pos;
  
  int numObj = 2;
  PImage bob_Omb, plant;
  PVector size = new PVector(35, 77);
  
  int spawnNum;
  color colour;
  
  boolean present = true;
  
  Objects() {
    pos = new PVector(random(width), random(height-600));
    
    //colour = color(random(255), random(255), random(255));
    spawnNum = int(random(10));
    
    
    bob_Omb = loadImage("bob_Omb.png");
    plant = loadImage("piranha_Plant.png");
    
    spawnNum = int(random(2));
    
  }

//https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery03/Enemy.pde
  void update() {
    
    if (pos.dist(pos) <5) {
      present = false;
    }
    for (Bullets bullets : trigger.bullet) {
      if(present && HitBox(pos, bullets.pos, size)) {
        present = false;
      }
    }
    
  }
  
  void draw() {
    noStroke();
    if (spawnNum==0) {
      image(bob_Omb,pos.x, pos.y, 60, 60);
    } else {      
      image(plant, pos.x, pos.y, 60, 60);
      
    }
  }
  
  void run() {
   update();
   draw();
  }
  
}

// https://forum.processing.org/two/discussion/12240/spawning-objects-using-timers

class Objects {
  PVector pos;
  
  int numObj = 2;
//PImage[] enemies = new PImage[numObj];
  PImage bob_Omb, plant;
  PVector size = new PVector(35, 77);
  
  int randSize, spawnNum;
  color colour;
  
  boolean present = true;
  
  Objects() {
    pos = new PVector(random(width), random(height-300));
    
    //colour = color(random(255), random(255), random(255));
    spawnNum = int(random(10));
    randSize = int(random(35,77));
    
    bob_Omb = loadImage("bob_Omb.png");
    bob_Omb.resize(randSize, randSize);
    
    plant = loadImage("piranha_Plant.png");
    plant.resize(randSize, randSize);
    
    spawnNum = int(random(2));
    
  }

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
      image(bob_Omb,pos.x, pos.y, randSize, randSize);
    } else {      
      image(plant, pos.x, pos.y, randSize, randSize);
      
    }
  }
  
  void run() {
   update();
   draw();
  }
  
}

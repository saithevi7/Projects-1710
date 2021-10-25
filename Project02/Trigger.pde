//https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery03/Cannon.pde
class Trigger {
 
  PVector pos;
  ArrayList<Bullets> bullet;
  float clockwise = 0;
  float counterClockwise = 2;
  
  PImage ship;
  
  Trigger(float x, float y) {
    pos = new PVector(x, y);
    bullet = new ArrayList<Bullets>();
    ship = loadImage("space_Invaders.png");
    ship.resize(60, 60);
  }
  
  void update() {   
    clockwise += counterClockwise;
    if (clockwise < -180 || clockwise > 110) {
      counterClockwise *= -1;
    }
    
    for(int i=bullet.size()-1; i>=0; i--) {
     Bullets bullets = bullet.get(i); 
     if(bullets.present) {
       bullets.run();
     }
     else {
       bullet.remove(i);
     }
    }
  }
  
  void shoot() {
    bullet.add(new Bullets(pos.x, pos.y, clockwise));
  }
  
  void draw() {
    pushMatrix();
    stroke(255);
    fill(0);
    rect(mouseX, mouseY, 30, 60);
    rotate(radians(clockwise));
    popMatrix();
    
    image(ship, mouseX, mouseY);
}
  
  void run() {
    update();
    draw();
  }
  
}

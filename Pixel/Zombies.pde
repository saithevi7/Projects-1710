



// zombies class 
class Zombies {
 
  PVector position;
  PImage zomImg;
  boolean appear = true;
  
  // constructor
  Zombies(float x, float y) {
    position = new PVector(x, y);
    
    zomImg = loadImage("zombie.png");
    zomImg.resize(zomImg.width/14, zomImg.height/14);
  }
  void update() {
  }
  
  void draw() {
    image(zomImg, position.x, position.y);
  }
  
  
  void run() {
    update();
    draw();
  }
  
}

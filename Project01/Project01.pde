PVector position, target;
boolean move = false;
PImage deemo, deemoLeftside, deemoRightside;

void setup() {
  size(800, 600, P2D);
  
  position = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));
  
  deemo = loadImage("deemo.png");
  deemo.resize(deemo.width/2, deemo.height/2);
  
  deemoLeftside = loadImage("deemoLeftside.png");
  deemoLeftside.resize(deemoLeftside.width/3, deemoLeftside.height/3);
  
  deemoRightside = loadImage("deemoRightside.png");
  deemoRightside.resize(deemoRightside.width/3, deemoRightside.height/3);
  
  imageMode(CENTER);
  
}

void draw() {
 background(255, 255, 255);
 
 PVector mousePos = new PVector(mouseX, mouseY);
 move = position.dist(mousePos) < 100;
 
 if (move) {
   position = position.lerp(target, 0.08);
   if (position.dist(target) < 5) {
     target = new PVector(random(width), random(height));
   }
 }
 image(deemoRightside, position.x, position.y);
 
 if (mousePressed) {
   image(deemoLeftside, position.x, position.y);
 } 
  
 
}

PVector position, target;
boolean isRunning = false;
PImage deemo, deemoLeftside, deemoRightside;

void setup() {
  size(800, 600, P2D);
  
  position = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));
  
  deemo = loadImage("deemo.png");
  deemo.resize(deemo.width/2, deemo.height/2);
  
  deemoLeftside = loadImage("deemoLeftside.png");
  deemoLeftside.resize(deemoLeftside.width/2, deemoLeftside.height/2);
  
  deemoRightside = loadImage("deemoRightside.png");
  deemoRightside.resize(deemoRightside.width/2, deemoRightside.height/2);
  
  imageMode(CENTER);
  
}

void draw() {
 background(255, 255, 255);
 
 PVector mousePos = new PVector(mouseX, mouseY);
 isRunning = position.dist(mousePos) < 100;
 
 if (isRunning) {
   position = position.lerp(target, 0.08);
   if (position.dist(target) < 5) {
     target = new PVector(random(width), random(height));
   }
 }
 image(deemo, position.x, position.y);
 
 if (mousePressed) {
   image(deemoLeftside, position.x, position.y);
 } 
  
 
}

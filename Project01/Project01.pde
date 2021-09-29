PVector position, target;
boolean isRunning = false;
PImage deemo;

void setup() {
  size(800m 600m P2D);
  
  position = new PVector(width/2, height/2);
  target = new Pvector(random(width), random(height));
  
  deemo = loadImage("Deemo.png");
  
  imageMode(CENTER);
}

void draw() {
 background(127);
 
 PVector mousePos = new PVector(mouseX, mouseY);
 isRunning = position.dist(mousePos) < 100;
 
 if (isRunning) {
   position = position.lerp(target, 0.08);
   if (position.dist(target) < 5) {
     target = new PVector(random(width), random(height));
   }
 }
 
 image(deemo, position.x, position.y);
}

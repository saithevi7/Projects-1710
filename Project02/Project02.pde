/* 
Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
10 / 18/ 2021
Wanted a moveable ship with rotating trigger shots.
But I couldn't find a way to make the trigger rotate. Shooting is off, hitbox interactions
don't seem to work. Everything else outputs fine.
*/

//https://forum.processing.org/two/discussion/12240/spawning-objects-using-timers

int addTime, subtractTime ;
int addSpawnTime = 4000, subtractSpawnTime = 12000;
color bg = color (192, 192, 192);
ArrayList <Objects> shapes = new ArrayList <Objects>();


Trigger trigger;

void setup() {
  size(800, 600, P2D);

  addTime = millis();
  subtractTime = millis();
  trigger = new Trigger(width, height);
 
  frameRate(60);
}
// https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery03/Artillery03.pde
void draw() {
  background(bg);
  
  trigger.run(); // run class, but it doesn't rotate
  
  
  if (millis() - addTime > addSpawnTime) {
    addTime = millis();
    addSpawnTime = int(random(2000, 4000));
    shapes.add(new Objects());
  }

  if (millis() - subtractTime > subtractSpawnTime) {
    subtractTime = millis();
    subtractSpawnTime = int(random(5000, 10000)); 
    shapes.remove(int(random(shapes.size())));
  }

  for (Objects i : shapes) {
    i.draw();
  }
  
  trigger.run();
  
}
  
boolean HitBox(PVector pos1, PVector pos2, PVector hitbox) {
  hitbox = hitbox.copy().div(2);
  
  if (pos1.x >= pos2.x - hitbox.x && pos1.x <= pos2.x + hitbox.x && pos1.y >= pos2.y - hitbox.y && pos1.y <= pos2.y + hitbox.y) {
    return true;
  }
  else {
    return false;
  } 
}

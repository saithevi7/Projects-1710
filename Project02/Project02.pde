// https://forum.processing.org/two/discussion/12240/spawning-objects-using-timers



int addTime, subtractTime ;
int addSpawnTime = 3000, subtractSpawnTime = 6000;//two seconds
color bg = color (255);
ArrayList <Objects> shapes = new ArrayList <Objects>();

Trigger trigger;

void setup() {
  size(800, 600, P2D);

  background(255);

  addTime = millis();
  subtractTime = millis();

  frameRate(60);
}

void draw() {
  background(bg);
  if (millis() - addTime > addSpawnTime) {
    addTime = millis();
    addSpawnTime = int(random(1000, 3000));
    shapes.add(new Objects());
  }

  if (millis() - subtractTime > subtractSpawnTime) {
    subtractTime = millis();
    subtractSpawnTime = int(random(2000, 4000)); 
    shapes.remove(int(random(shapes.size())));
  }

  for (Objects i : shapes) {
    i.draw();
  }
  
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

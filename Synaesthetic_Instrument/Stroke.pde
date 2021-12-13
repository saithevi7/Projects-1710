// https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week14/Instrument01/Stroke.pde
// Stroke class
class Stroke {
  
  // variables 
  ArrayList<PVector> points;
  int lifetime = 1000;
  int timestamp = 0;
  boolean alive = true;
  
  // constructor
  Stroke() {
    points = new ArrayList<PVector>();
    timestamp = millis();
  }
  
  // life span
  void update() {
    if (millis() > timestamp + lifetime) {
      alive = false;
    }
  }
  /* draw func
  * increases stroke size of ALL shapes. The more you move your mouse while holding,
  the "weirder" or "funkier" everything becomes. */
  void draw() {
    for (int i=0; i<points.size(); i++) {
      PVector p = points.get(i);
      p.x += random(8) - random(6);
      strokeWeight(random(0, 107));
      point(p.x, p.y);
      if (i > 0) {
        PVector p2 = points.get(i-1);
        strokeWeight(random(54, 124)); 
        rect(p.x, p.y, p2.x, p2.y);
      }
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}

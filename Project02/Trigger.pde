class Trigger {
 
  PVector pos;
  ArrayList<Bullets> bullet;
  
  Trigger(float mouseX, float mouseY) {
    pos = new PVector(mouseX, mouseY);
    bullet = new ArrayList<Bullets>();
  }
  
  void update() {   
    for(int i=bullet.size()-1; i>=0; i--) {
     Bullets bullets = bullet.get(i); 
     if(bullets.present){
       bullets.run();
     }
     else {
       bullet.remove(i);
     }
    }
  }
  
  void shoot() {
    bullet.add(new Bullets(mouseX, mouseY, 10));
  }
  
  void draw() {
    fill(0, 0, 0);
    stroke(0);
    //pushMatrix();
    //translate(mouseX, mouseY);
    rect(mouseX, mouseY, 50, 100);
  }
  
  void run() {
    update();
    draw();
  }
  
}

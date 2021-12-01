/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
11 / 11/ 2021

Here in this project, I tried to make a dark zombie game. I tried to 
implement this cool brightness light effect and other pixel effects. 
First I tried to make it so random zombies would spawn by using an 
array and another class but then it would either spawn 1 zombie 
and/or the zombies would go over the darkness so I stuck with this. 
*/

// Variables
PImage img, zomImg;

float posX;
float speedX = 4;
float directionX = 1;


// setup for pixel manipulaton and zombie spawns
void setup() {
  size(319, 240);
  frameRate(30);
  
  img = loadImage("street.jpg");
  img.loadPixels();
  loadPixels();
  
  zomImg = loadImage("zombie.png");
  zomImg.resize(zomImg.width/5, zomImg.height/5);
  zomImg.loadPixels();
  // manipluate pixels in the zombie image to look creepier
  for (int i=0; i<zomImg.pixels.length; i++) {
    if (red(zomImg.pixels[i]) > 145) {
      zomImg.pixels[i] = color(255, 0, 0);
    }
  }
  loadPixels();     
  zomImg.updatePixels();
}
// https://processing.org/examples/brightnesspixels.html by Daniel Shiffman
// brightness adjustment 
void draw() {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // find 1d location from 2d grid
      int loc = x + y*img.width;
      
      // r,g,b values from selected image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      
      // brightness depending on mouse
      float maxdist = 50;
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      
      // Constrain red to a range 
      r = constrain(r, 0, 255);
      
      // new color and set pixel
      color c = color(r);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
    
    posX = posX + (speedX * directionX);
    if (posX > width-10 || posX < -10) {
      directionX *= -1;
      }
    
    for (int x = 0; x < zomImg.width; x++) {
      for (int y = 0; y < zomImg.height; y++ ) {
        // find 1d location from 2d grid
        int loc = x + y*zomImg.width;
        
        // r,g,b values from selected image
        float r,g,b;
        r = red (zomImg.pixels[loc]);
        g = green (zomImg.pixels[loc]);
        b = blue (zomImg.pixels[loc]);
        
        // brightness depending on mouse
        float maxdist = 50;
        float d = dist(x, y, mouseX, mouseY);
        float adjustbrightness = 255*(maxdist-d)/maxdist;
        r += adjustbrightness;
        g += adjustbrightness;
        b += adjustbrightness;
        
        // Constrain red to a range 
        r = constrain(r, 0, 255);
        g = constrain(g, 0, 255);
        b = constrain(b, 0, 255);
        
        // new color and set pixel
        color c = color(r, g, b);
        pixels[y*width + x] = c;
      }
    }
    updatePixels();
    image(zomImg, posX, 100, width/5, height/5);
}

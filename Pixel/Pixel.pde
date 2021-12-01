/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
11 / 11/ 2021
*/

// Variables
PImage img, zomImg;
//int numZomb = 6;

float posX;
float speedX = 4;
float directionX = 1;

// array
//Zombies[] zomb = new Zombies[numZomb];

// setup for pixel manipulaton and zombie spawns
void setup() {
  size(319, 240);
  frameRate(30);
  
  img = loadImage("street.jpg");
  img.loadPixels();
  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
  loadPixels();
  
  zomImg = loadImage("zombie.png");
  zomImg.resize(zomImg.width/5, zomImg.height/5);
  zomImg.loadPixels();
  loadPixels(); 
  
  
}

void draw() {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      // Calculate an amount to change brightness based on proximity to the mouse
      float maxdist = 50;//dist(0,0,width,height);
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      //g += adjustbrightness;
      //b += adjustbrightness;
      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);
      //g = constrain(g, 0, 255);
      //b = constrain(b, 0, 255);
      // Make a new color and set pixel in the window
      //color c = color(r, g, b);
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
        // Calculate the 1D location from a 2D grid
        int loc = x + y*zomImg.width;
        // Get the R,G,B values from image
        float r,g,b;
        r = red (zomImg.pixels[loc]);
        g = green (zomImg.pixels[loc]);
        b = blue (zomImg.pixels[loc]);
        // Calculate an amount to change brightness based on proximity to the mouse
        float maxdist = 50;//dist(0,0,width,height);
        float d = dist(x, y, mouseX, mouseY);
        float adjustbrightness = 255*(maxdist-d)/maxdist;
        r += adjustbrightness;
        g += adjustbrightness;
        b += adjustbrightness;
        // Constrain RGB to make sure they are within 0-255 color range
        r = constrain(r, 0, 255);
        g = constrain(g, 0, 255);
        b = constrain(b, 0, 255);
        // Make a new color and set pixel in the window
        color c = color(r, g, b);
        //color c = color(r);
        pixels[y*width + x] = c;
      }
    }
    updatePixels();
    image(zomImg, posX, 100, width/5, height/5);
}

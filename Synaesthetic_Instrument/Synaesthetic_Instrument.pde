/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
12 / 06/ 2021
Project 4 

I made an instrument that plays a song and manipulates shapes abstractly based on
the frequency of the song and an interation with the instrument with sound from
imported libraries from Nick's week 14 instrument example (link down below). 

https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week14/Instrument01
*/


import ddf.minim.*;

Minim minim;

AudioPlayer audio;


// https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week14/Instrument01/Instrument01.pde
ArrayList<Stroke> strokes;
int marktime = 0;
int timeout = 1000;

void setup() {
  size(1100, 900, P2D);
  setupXYscope();
  
  strokes = new ArrayList<Stroke>();
  
  minim = new Minim(this);
  // https://pixabay.com/music/bossa-nova-quando-acoustic-guitar-bossa-nova-3946/ 
  audio = minim.loadFile("guitar_jam.mp3"); //Posted by JuliusH from pixabay.
  audio.play();
}

void draw() {
  background(127);

  // https://adams2.home.blog/2019/01/25/making-shapes-move-with-audio-in-processing/
  // movement of shapes based on frequency of the music
  fill(0, 53, 13);
  ellipse(351, 140, audio.left.get(1)*800, 200);
  
  fill(216, 191, 216);
  ellipse(400, 460, audio.left.get(1)*800, 200);
   
  fill(176, 196, 222);
  ellipse(400, 460, audio.left.get(1)*400, 50);
  
  fill(143, 43, 0); 
  triangle(700, 100, audio.left.get(1)*540, 420, 490, 420);
  triangle(600, 100, audio.left.get(1)*440, audio.left.get(1)*10, 10, 100);
  
  updateXYscope();
  
  for (int i=strokes.size()-1; i >= 0; i--) {
    Stroke stroke = strokes.get(i);
    stroke.run();
    if (!stroke.alive) strokes.remove(i);
  }
  
  if (millis() > marktime + timeout) {
    xy.clearWaves();
  }

  surface.setTitle("" + frameRate);
}

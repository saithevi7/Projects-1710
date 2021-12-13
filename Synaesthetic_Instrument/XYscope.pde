// https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week14/Instrument01/XYscope.pde

import xyscope.*;
import ddf.minim.*; 

XYscope xy;

// setup for XYscope
void setupXYscope() {
  xy = new XYscope(this);
}

// visuals based on audio from library or the mp3 player
void updateXYscope() {  
  xy.buildWaves();
  xy.drawAll();
}

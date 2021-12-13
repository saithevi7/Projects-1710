// https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week14/Instrument01/Controls.pde
// Controls 
void mouseDragged() { // mouse dragged
  // add point based on width/height
  xy.line(mouseX, mouseY, pmouseX, pmouseY);
  
  if (strokes.size() > 0) {
    Stroke stroke = strokes.get(strokes.size()-1);
    stroke.points.add(new PVector(mouseX, mouseY));
    stroke.timestamp = millis();
  }

  marktime = millis();
}

// press backspace to clear everything 
void keyPressed() { 
  if (key == BACKSPACE) { 
    xy.clearWaves();
  }
}

// press mouse to create more shapes from Stroke class
void mousePressed() {
  Stroke stroke = new Stroke();
  strokes.add(stroke);
}

// release mouse to clear everything
void mouseReleased() {
    xy.clearWaves(); // clear everything
}

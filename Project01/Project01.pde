int numDeemo = 1;
int numNotes = 12;

Deemo[] mainDeemo = new Deemo[numDeemo];
musicNotes[] notes = new musicNotes[numNotes];

void setup() {
  size(800, 600, P2D);
  
  for (int i=0; i<mainDeemo.length; i++) {
    mainDeemo[i] = new Deemo(random(width), random(height));
  }
  
  for (int i=0; i<notes.length; i++) {
    notes[i] = new musicNotes(random(width), random(height));
  }
    
}

void draw() {
  background(255, 255, 255);
  
  for (int i=0; i<mainDeemo.length; i++) {
    mainDeemo[i].run(); 
  }
  
  for (int i=0; i<notes.length; i++) {
    notes[i].run();
    
  }
}

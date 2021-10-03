/* Sairus Pradhan (218946467)
LE EECS 1710 - Lab 1
09 / 28/ 2021

Project 1 - Ghostly figure name "Deemo" in search for his muscial notes.
You can either block him by simply putting your crusor on him and he moves away 
OR  you can allow him to get all of his notes for a suprise...

P.S. Pictures for the Deemo figure and Notes were drawn.
*/

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

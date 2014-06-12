
int videoScale = 25;

// Number of columns and rows in our system
int cols, rows;

void setup() {
  
  Board a = new Board();

  size(600, 800);
  
  // Initialize columns and rows
  cols = width/videoScale;
  rows = height/videoScale;

  background(225);

  // Begin loop for columns
  for (int i = 3; i < 9; i++) {
    // Begin loop for rows
    for (int j = 3; j < 9; j++) {
      
      // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale*2;
      int y = j*videoScale*2+150;
      fill(a.randColor());
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      ellipse(x,y,videoScale,videoScale); 
    }
  }
  noLoop();
}

void draw() { 
  

}

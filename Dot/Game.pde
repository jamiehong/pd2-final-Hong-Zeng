// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-6: Drawing a grid of squares

// Size of each cell in the grid, ratio of window size to video size
// 80 * 8 = 640
// 60 * 8 = 480
int videoScale = 24;

// Number of columns and rows in our system
int cols, rows;

void setup() {
  size(600, 800);
  
  // Initialize columns and rows
  cols = width/videoScale;
  rows = height/videoScale;
}

void draw() {
  
  // Begin loop for columns
  for (int i = 3; i < 9; i++) {
    // Begin loop for rows
    for (int j = 3; j < 9; j++) {
      
      // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale*2+12;
      int y = j*videoScale*2+12+150;
      fill(255);
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      ellipse(x,y,videoScale,videoScale); 
    }
  }
}

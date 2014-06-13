
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
      color tempC = a.randColor();
      a.set(new Dot(tempC), i-3, j-3);
      fill(tempC);
      stroke(0);
      
    }
  }
  noLoop();
}

void draw() { 
  

}

int XMouseToCart(int x){
  if (x >= 138 && x <= 412){
    if (x <= 162)
      return 0;
    else if (x >= 188 && x <= 212)
      return 1;
    else if (x >= 238 && x <= 262)
      return 2;
    else if (x >= 288 && x <= 312)
      return 3;
    else if (x >= 338 && x <= 362)
      return 4;
    else if (x >= 388)
      return 5;
    else
      return -1;
  }
  else return -1;
}

int YMouseToCart(int y){
  return XMouseToCart(y - 150);
}
    

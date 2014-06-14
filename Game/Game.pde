
int videoScale = 25;
int time;
int score;

Dot currentD; //the dot being worked on
int[] xyDeletes = new int[72]; //to store xy of dots to be deleted
int deletions; //# of deletions
Board a;
boolean square; //if you make a square, all dots of that color get deleted.

void setup() {
  

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
}//needs testing...

int YMouseToCart(int y){
  return XMouseToCart(y - 150);
}
    
int XCartToMouse(int x){
  return (x+3)*50;
}

int YCartToMouse(int y){
  return (y+6)*50+150;
}

boolean within(int x, int y){   //true if mouse is on the dot, false if not.. inputs 0-5
  if (x < 0 || x > 5 || y < 0 || x > 5)
    return false;
  else{
    int a = XCartToMouse(x);
    int b = YCartToMouse(y);
    if (abs(a-mouseX) <= 12 && abs(b-mouseY) <= 12)
      return true;
    else
      return false;
  }
}//needs testing

void mousePressed(){
  /*
  int x = XMouseToCart(mouseX);
  int y = YMouseToCart(mouseY);
  if (x != -1 && y!= -1){
    currentD = a.get(x,y);
    currentD.flag();
    deletions = 1;
    xyDeletes[0] = x;
    xyDeletes[1] = y;
  }
  
  */
  //to test the conversions
  println(XMouseToCart(mouseX));
  println(YMouseToCart(mouseY));
}


void mouseDragged(){
  int x = xyDeletes[deletions*2-2];
  int y = xyDeletes[deletions*2-1];
  Dot woah;
  if (within(x-1,y))
    woah = a[x-1,y];
  else if (within(x,y-1))
    woah = a[x,y-1];
  else if (within(x+1,y))
    woah = a[x+1,y];
  else if (within(x,y+1))
    woah = a[x,y+1];
    
  if (woah != null && woah.getColor().equals(currentD.getColor())){
    if (woah.equals(currentD.getPrev())){
      deletions--;
      currentD.unFlag();
      currentD = currentD.getPrev();
      
    }
    else{
      woah.setPrev(currentD)
      currentD = woah;
      if (currentD.getFlagged())
        square = true;
      currentD.flag();
      deletions++;
      xyDeletes[deletions*2-2] == XMouseToCart(mouseX);
      xyDeletes[deletions*2-1] == YMouseToCart(mouseY);
    }
  }
  
}

void mouseReleased(){
  //check if deletions >0
  //check if player made a square,
      //if he did then delete all dots of that color, give points
      //else give points, delete the selected dots using xyDeletes[]
  //drop all the stuff
  //add new stuff
  //reset the variables? maybe not necessary
}
  
  
  
  
  
  
  

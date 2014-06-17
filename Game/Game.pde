
int videoScale = 25;
int pTime;
int time = 60;
int score;

Dot currentD; //the dot being worked on
int[] xyDeletes = new int[72]; //to store xy of dots to be deleted
int deletions; //# of deletions
Board a;
boolean square; //if you make a square, all dots of that color get deleted.

void setup() {
  
  a = new Board();
  size(600, 800);
  


  background(225);

  for (int i = 3; i < 9; i++) {
    for (int j = 3; j < 9; j++) {
      
      int x = i*videoScale*2;
      int y = j*videoScale*2+150;
      color tempC = a.randColor();
      fill(tempC);
      noStroke();
      ellipse(x,y,videoScale,videoScale);
      a.set(new Dot(tempC),i-3,j-3);
    }
  }

  pTime = second();
  time = 62;
  fill(0);
  rect(0,0,100,50);
  fill(225);
  textSize(20);
  text(""+time, 20,10,60,30);
}

void draw() { 
  if (62 - timeLapsed() != time){
    time -= 1;
    
    fill(225);
    noStroke();
    rect(0,0,100,50);
    fill(0);
    textSize(20);
    text("Time:"+time, 20,10,100,30);
  }
  
  if (time < 0){
    background(0);
    textSize(40);
    fill(225);
    text("Score:" + score, 20, 10, 300, 150);
    noLoop();
  }
  
}

int timeLapsed(){
  if (second() - pTime < 0)
    return second() - pTime + 60;
  else
    return second() - pTime;
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
  return (y+6)*50;
}

boolean within(int x, int y){   //true if mouse is on the dot, false if not.. inputs 0-5
  if (x < 0 || x > 5 || y < 0 || y > 5)
    return false;
  else{
    int i = XCartToMouse(x);
    int j = YCartToMouse(y);
    if (abs(i-mouseX) <= 12 && abs(j-mouseY) <= 12)
      return true;
    else
      return false;
  }
}//needs testing

void mousePressed(){
 
  int x = XMouseToCart(mouseX);
  int y = YMouseToCart(mouseY);
  if (x != -1 && y!= -1){
    currentD = a.getDot(x,y);
    currentD.flag();
    deletions = 1;
    xyDeletes[0] = x;
    xyDeletes[1] = y;
  }
  
}

void connect(int x1, int y1, int x2, int y2, color c){
  int xx1 = XCartToMouse(x1)/10;
  int yy1 = YCartToMouse(y1)/10;
  int xx2 = XCartToMouse(x2)/10;
  int yy2 = YCartToMouse(y2)/10;
  stroke(c);
  strokeWeight(5);
  line(xx1*4+xx2*6, yy1*4+yy2*6 ,xx2*4+xx1*6 ,yy2*4+yy1*6);

}


void mouseDragged(){
  if (deletions > 0){
    int x = xyDeletes[deletions*2-2];
    int y = xyDeletes[deletions*2-1];
    Dot woah = null;
    if (within(x-1,y))
      woah = a.getDot(x-1,y);
    else if (within(x,y-1))
      woah = a.getDot(x,y-1);
    else if (within(x+1,y))
      woah = a.getDot(x+1,y);
    else if (within(x,y+1))
      woah = a.getDot(x,y+1);

    if (woah != null && 
        woah.getColor() == currentD.getColor()){
      if (woah.equals(currentD.getPrev())){
        connect(xyDeletes[deletions*2-2],xyDeletes[deletions*2-1],xyDeletes[deletions*2-4],xyDeletes[deletions*2-3],color(225));
        deletions--;
        currentD.unFlag();
        currentD = currentD.getPrev();
      
      }
      else{
        //print("selcetd");
        woah.setPrev(currentD);
        currentD = woah;
        if (currentD.getFlagged())
          square = true;
        currentD.flag();
        deletions++;
        xyDeletes[deletions*2-2] = XMouseToCart(mouseX);
        xyDeletes[deletions*2-1] = YMouseToCart(mouseY);
        connect(xyDeletes[deletions*2-2],xyDeletes[deletions*2-1],xyDeletes[deletions*2-4],xyDeletes[deletions*2-3],currentD.getColor());
      }
    }
  }  
}

void delay(int x){
  int now = millis();
  while(millis() - now < x){}
}

void updateScore(){
  fill(225);
  noStroke();
  rect(500, 0, 100, 50);
  fill(0);
  textSize(20);
  text(""+score, 520,10,80,40);
}

void update(){
  fill(225);
  noStroke();
  rect(0,150,600,650);
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 6; j++) {
      
      int x = (i+3)*videoScale*2;
      int y = (j+3)*videoScale*2+150;
      fill(a.getDot(i,j).getColor());
      noStroke();
      ellipse(x,y,videoScale,videoScale);
    }
  }
}

void mouseReleased(){
  if(deletions > 1){
    if(square){
      square = false;
      score += a.square(currentD.getColor());
      deletions = 0;
      a.dropDot();

      updateScore();
    }
    else{
      score += deletions;
      fill(255);
      for(int asd = deletions; asd > 0; asd--){
        int xcoor = xyDeletes[asd*2-2];
        int ycoor = xyDeletes[asd*2-1];
        a.set(null,xcoor,ycoor);
      }
      delay(100);
      deletions = 0;
      a.dropDot();
      updateScore();
    }

  }
  else if(deletions == 1)
    currentD.unFlag();
  a.checkMoves();
  update();
}
  
  
  
  
  
  
  

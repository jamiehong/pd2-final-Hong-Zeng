public class Board{
  private Dot[][] dots;
  private int score;
  public color[] colors;
    
  public Board(){
    colors = new color[5];
    colors[0] = color(#FF7575);
    colors[1] = color(#48D1CC);
    colors[2] = color(#9932CC);
    colors[3] = color(#FFD700);
    colors[4] = color(#000080);
    dots = new Dot[6][6];
  }
  
  public color randColor(){
     int a = (int) (5* Math.random());
     return colors[a];
  }

  public Dot getDot(int x, int y){
    return dots[x][y];
  }

  public void set(Dot d, int x, int y){
     dots[x][y] = d;
  }
  
//clears a dot by moving the dots on top of it down, and makes the top dot a rand color
  public void dropDot(){
     for (int x = dots.length-1; x >= 0; x --){
       for(int y = dots[0].length-1; y >=0; y--){
         while (dots[x][y] == null){
	   for (int a = y; a > 0; a--){
	     dots[x][a]= dots[x][a-1];
	   }
	   dots[x][0] = new Dot(randColor());
	 } 
       } 
     }
  }
  
  public int square(color c){
    int retInt = 0;
    for(int x = 0; x < dots.length; x++){
      for(int y = 0; y < dots[0].length; y++){
        if (dots[x][y].getColor() == c){
          dots[x][y] = null;
          retInt++;
        }
      }
    }
    return retInt;
  }

  public void checkMoves(){
     boolean move = false;
     for (int x = 0; x < dots.length; x++){
      for (int y = 0; y < dots[0].length; y++){
	try{
	  if(dots[x+1][y].getColor() == dots[x][y].getColor()){
	    move = true;
	  }if(dots[x-1][y].getColor() == dots[x][y].getColor()){
	    move = true;
	  }if(dots[x][y+1].getColor() == dots[x][y].getColor()){
	    move = true;
	  }if(dots[x][y-1].getColor() == dots[x][y].getColor()){
	    move = true;
	  }	  
	}catch(ArrayIndexOutOfBoundsException e){
          try{
          if(dots[x][y-1].getColor() == dots[x][y].getColor())
            move = true;
          if(dots[x][y+1].getColor() == dots[x][y].getColor())
            move = true;
          if(dots[x-1][y].getColor() == dots[x][y].getColor())
            move = true;
          }
          catch(ArrayIndexOutOfBoundsException a){}
        }
      }
     }
     if(move == false){
        scramble();
        return;
      }
     	
    
  }

  private void scramble(){
     textSize(20);
     fill(0);
     text("Had no moves, had to scramble", 20,75,500,40);
     for (int x=0;x<dots.length;x++){
       for(int y=0;y<dots[0].length;y++){
         dots[x][y] = new Dot(randColor());
       }
     }
  }
}

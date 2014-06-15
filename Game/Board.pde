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
  public void drop(int xcor, int ycor){
    clearDot(xcor, ycor);
    add();
  }

//clears a dot by moving the dots on top of it down, and makes the top dots null
  public void clearDot(int xcor, int ycor){
     for(int a = xcor; a > 1; a--){
        dots[a][ycor] = dots[a - 1][ycor];
     }dots[0][ycor] = null;
  } 
//adds random colored dots to places in the array that are null;
  public void add(){
     for (int a = 0; a < dots.length; a++){
       for (int b= 0; b < dots[0].length; b++){
          if(dots[a][b] == null){
	     dots[a][b] = new Dot(randColor());
	  }else{b = b+dots[0].length;}
       }
     }
  }

 
}

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
      
  }
  
  public color randColor(){
     int a = (int) (5* Math.random());
     return colors[a];
  }


}

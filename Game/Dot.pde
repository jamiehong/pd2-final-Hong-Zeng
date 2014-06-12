public class Dot{
  private color col;
  private Dot next;
  private Board brd;
  private boolean flagged;
    
  public Dot(color a){
      col = a;
      next = null;
  }
  
  public Dot getNext(){return Dot;}
  public void setNext(Dot a){next = a;}
  
  public boolean getFlagged(){return flagged;}
  public void flag(){flagged = true;}
  
  public color getColor(){return color;}

}

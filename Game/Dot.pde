public class Dot{
  private color colr;
  private Dot prev;
//  private Board brd;
  private boolean flagged; //used for square interaction

  

  public Dot(color a){
      colr = a;
      prev = null;
  }

  public color getColor(){return colr;}
  public void setColor(color c){
      colr = c;
  }
  
  public Dot getPrev()
      {return prev;}
      
  public void setPrev(Dot a)
      {prev = a;}

  public boolean getFlagged(){return flagged;}
  public void flag(){flagged = true;}
  public void unFlag(){flagged = false;}


}

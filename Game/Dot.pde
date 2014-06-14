public class Dot{
  private color colr;
<<<<<<< HEAD
  
  private int xcor;
  private int ycor; 
  
  public Dot(color a){
      colr = a;     
  }    

  public Dot(color a, int x, int y){
      colr= a;
      xcor = x;
      ycor = y;
  }
public Dot  
  public color getColor(){return colr;}
=======
  private Dot next;
  private Board brd;
  private boolean flagged;

  public Dot(color a){
      colr = a;
      next = null;
  }

  public Dot getNext()
      {return next;}
      
  public void setNext(Dot a)
      {next = a;}

  public boolean getFlagged(){return flagged;}
  public void flag(){flagged = true;}

  public color getColor(){return colr;}

>>>>>>> FETCH_HEAD
}

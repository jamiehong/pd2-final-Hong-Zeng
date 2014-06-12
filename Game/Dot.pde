public class Dot{
  private color colr;
  private Dot next;
  private Board brd;
<<<<<<< HEAD
  
  private Dot next;
  
  public Dot(color a){
      col = a;
      next = null;
  }  
  
  public clearDot(){
  	 Dot temp = this;
	 while (temp.getNext() != null){
	       temp = temp.getNext();
	 }  
=======
  private boolean flagged;
    
  public Dot(color a){
      colr = a;
      next = null;
  }
  
  public Dot getNext(){return next;}
  public void setNext(Dot a){next = a;}
  
  public boolean getFlagged(){return flagged;}
  public void flag(){flagged = true;}
  
  public color getColor(){return colr;}
>>>>>>> FETCH_HEAD

}

public class Dot{
  private color col;
  private int xCor;
  private int yCor;
  private Dot next;
  private Board brd;
  
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

}

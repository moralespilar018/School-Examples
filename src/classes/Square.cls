public class Square extends Rectangle {
    //constructur calls superclass constructor 
    public Square(integer sideLength){
        super(sideLength, sideLength); 
    }
    //methods 
    public override void setHeight(integer sideLength){
    	super.setHeight(sideLength);    
    }
    
    public override void setWidth(integer sideLength){
        super.setWidth(sideLength); 
    }
}
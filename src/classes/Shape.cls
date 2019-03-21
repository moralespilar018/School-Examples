public abstract class Shape implements Calculatable, Drawable{
    private integer numberOfSides; 
    
    public integer getNumberOfSides(){
        return this.numberOfSides; 
    }
    
    public void setNumberOfSides(integer numberOfSides){
        this.numberOfSides = numberOfSides; 
    }
}
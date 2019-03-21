public class StaticClass {
	//static variable 
    private static integer numberOfObjectsCreated = 0; 
	//instance method 
	private integer secondNumber = 0; 

    public StaticClass() {
        numberOfObjectsCreated++; 
        secondNumber++; 
    }
	
    public void incrementNumberOfObjectsCreated(){
        numberOfObjectsCreated++; 
    }

	public void incrementSecondNumber(){
        secondNumber++;
    }    
    
    public integer getNumberOfObjectsCreated(){
        return numberOfObjectsCreated; 
    }
    
    public integer getSecondNumber(){
        return secondNumber; 
    }
    
    
    
}
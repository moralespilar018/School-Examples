public abstract class Dog extends Animal {
	/*/abstract method 
    public override void sound(){
    	system.debug('Bark');
    }*/
    public override abstract void sound(); 
    //concrete method 
    public void wagsTail(){
        system.debug('Wags tail');
    }
    
}
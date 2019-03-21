public class Performance extends Play {
	//fields 
    private string theater; 
    Critic performanceCritic; 
    //constructors 
    public Performance(){
        this.theater = ' '; 
        this.performanceCritic = new Critic();
    }
    
    public Performance(string title, string author, Critic performanceCritic){
    	super(title);  
        setAuthor(author);
		this.performanceCritic = performanceCritic;  
    }

    public void setTheater(string atheater){
        theater = atheater; 
    }
    
    public string getTheater(){
        return this.theater; 
    }
    
    public override void display(){
        super.display(); 
		system.debug('Theater: ' + getTheater());
        performanceCritic.display(); 
        
    }    
}
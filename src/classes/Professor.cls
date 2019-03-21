public class Professor extends Person {
	
    //Properties 
	//MUST be PUBLIC 
    public decimal salary {
        get {
            if( salary == NULL ){
            	salary = 0.0;           
            }
            // If you specity an implementation for a get, 
            // you must provide a return statement 
            return salary; 
        } 
        set {
            // Value is a keyword which represents the value a property 
            // is beign set to 
            if(value < 0.0){
                system.debug('You cannot have a negative salary. that\'s called debt:');
            } else{ 
            	salary = value; 
            }
        }
     }
    //constructors 
    /* 
     * this default constructor will automatically call the Person 
     * deafult constructor, setting name and email to empty string 
     * Likewise, it will set
     */
    public Professor(){
        salary = 0.0; 
    }
    /* 
     * This constructor will call person constructor setting 
     * name to the specified parameter (name).
     * likewise, it will call the set email method from the parent class, 
     * Lastly, it will set salary to default value  
     */
    public Professor(string name, string email){
        super(name); 
        setEmail(email); 
    	this.salary = 0.0; 
    }
    
    /*
     * the display method calls a Person display method to display 
     * the name and email address
     * Afterwards the professor's salary will be displayed 
     */ 
    public override void display(){
        super.display();
        system.debug('Salary: ' + this.salary); 
    }
    
}
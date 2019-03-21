public virtual class Person {
    
    // Fields
    private string name;
    private string email;
    
    
    // Constructors
    
    // Default Constructor
    public Person() {
    	System.debug('Hello Moto!'); 
        this.name = '';
        this.email = '';
    }
    
    public Person(string name) {
        this.name = name;
        
    }
    
    // Accessors or Getters
    
    public string getName() {
        // Check if user has permission
        return this.name;
    }
    
    public string getEmail() {
        // Check if user has permission
        return this.email;
    }
    
    // Mutators or Setters
    public void setName(string name) {
        this.name = name;
    }
    
    public void setEmail(string email) {
        // We use setters to validate the values we're setting
        this.email = email;
    }
    
    // marking a method virtual mean it CAN be overriden 
    // not requiered 
    public virtual void display() {
        System.debug('Name: ' + this.name);
        System.debug('Email: ' + this.email);
    }
    
    
}
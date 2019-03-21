public class Employee extends Person {
    //company field 
    //private string company; 
    
    //Property for company 
    public string company{
        get{
            if(company == NULL){
                company = ' ';  //set to empty string 
            }
            return company;    //if not null return the string       
        }
        set{
         
        }
    }
    
    //default constructor 
    public Employee(){
        this.company = company; 
    }
    
    public Employee(string name, string email){
        super(name);
        setEmail(email); 
        this.company = company; 
    }
    
    public override void display(){
        super.display(); 
        system.debug('Company: ' + this.company); 
    }
    
}
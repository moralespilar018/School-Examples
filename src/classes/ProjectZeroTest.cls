@isTest
public class ProjectZeroTest {
    @isTest static void testFibonacci(){
        // Single Action -Positive 
        System.assertEquals(1, ProjectZero.fibonacci(1)); 
        System.assertEquals(2, ProjectZero.fibonacci(1));
        System.assertEquals(3, ProjectZero.fibonacci(2));
        System.assertEquals(1, ProjectZero.fibonacci(1));
        System.assertEquals(89, ProjectZero.fibonacci(11));
		System.assertEquals(6765, ProjectZero.fibonacci(20));
        System.assertEquals(196418, ProjectZero.fibonacci(27));
        //Single Action Negative 
        System.assertEquals(-1, ProjectZero.fibonacci(-5));
    }
    
    @isTest static void testSortArray(){
        List<integer> unsortedArray = new list<integer> {2,4,5,1,3,1}; 
		List<integer> sortedArray = new list<integer> {1,1,2,3,4,5}; 	
        List<integer> returnedArray = ProjectZero.sortArray(unsortedArray); 
        
        for(integer i = 0 ; i < sortedArray.size(); i++){
            System.assertEquals(sortedArray[i], returnedArray[i]); 
        }
    }
    
    @isTest static void testFactorial(){
        // Single Action -Zero 
        System.assertEquals(1, ProjectZero.factorial(0)); 
        // Single Action Positive 
        System.assertEquals(2, ProjectZero.factorial(2));
        System.assertEquals(6, ProjectZero.factorial(3));
        System.assertEquals(3628800, ProjectZero.factorial(10));
        
    }
    
    @isTest static void testRotateLeft(){
        integer rotateI = 1; 
    	List<integer> unRotatedArray = new list<integer> {2,4,5,1,3,1}; 
		List<integer> rotatedArray = new list<integer> {4,5,1,3,1,2}; 	
        List<integer> returnedArray = ProjectZero.rotateLeft(unrotatedArray, 1); 
        
        for(integer i = 0 ; i < rotatedArray.size(); i++){
            System.assertEquals(rotatedArray[i], returnedArray[i]); 
        }   
    }
    
    @isTest static void testUpdateAccountSize(){
        //Test single account 
        insert new Account(Name = 'Test12345', NumberOfEmployees = 1);
		//insert new Account(Name = 'Test123456', NumberOfEmployees = 1001); 
       // insert new Account(Name = 'Test1234567', NumberOfEmployees = 11000); 
		ProjectZero.updateAccountSize(); 
        
        Account a1 = [SELECT Size__c FROM Account WHERE Name = 'Test12345' LIMIT 1]; 
        System.assertEquals('Small', a1.Size__c); 
		//Account a2 = [SELECT Size__c FROM Account WHERE Name = 'Test123456' LIMIT 1 ]; 
        //System.assertEquals('Medium', a2.Size__c);
		//Account a3 = [SELECT Size__c FROM Account WHERE Name = 'Test1234567' LIMIT 1 ]; 
        //System.assertEquals('Large', a3.Size__c);
        
        // Test Bulk Action - Positive 
        List<Account> accs = [SELECT NumberOfEmployees, Size__c FROM Account WHERE Name LIKE 'Test%']; 
        for(Account a : accs){
            if(a.NumberOfEmployees < 1000){
            	System.assertEquals('Small', a.Size__c);   
            } else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000){
                System.assertEquals('Medium', a.Size__c); 
            }else{
                System.assertEquals('Large', a.Size__c); 
            }
        }
      
    }
    
    @isTest static void testUpdateCALeads(){
        // Create Ca Leads with Open status 
    	list<Lead> leadList = [SELECT State, Status, Description
                              FROM Lead]; 
        for(Lead lList : leadList){
            lList.State = 'CA'; 
            lList.Status = 'Open'; 
        }    
        //update 
        update leadList; 
        // call function 
        ProjectZero.updateCALeads(); 
        // check function did what it's supposed to 
        for(Lead lList : leadList){
            System.assertEquals('CA', lList.State); 
            System.assertEquals( 'Closed', lList.Status ); 
            System.assertEquals('We are no longer doing business in California', lList.Description  ); 
        }
    }
    
    @isTest static void testUpdateOpportunitiesPastClosedDate(){
        list<Opportunity> oppList = [SELECT StageName  
                                     FROM Opportunity]; 
        for(Opportunity opList : oppList){
            opList.StageName = 'Prospect'; 
        }
        
        update oppList; 
        
        ProjectZero.updateOpportunitiesPastClosedDate(); 
        for(Opportunity opList : oppList){
        	System.assertEquals('Closed Lost', opList.StageName);  
        }
        
    }
    
    
    
}
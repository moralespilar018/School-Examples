public class ProjectZero {
	
    
    /* #2
     * If n is less than or equal to zero return the value 
     * Else recall function with prev and and second prev number 
     * 
     * */
    
    public static integer fibonacci(integer n){
        if(n <= 1){
            return n; 
        }
        return fibonacci(n-1) + fibonacci(n-2); 
		
    }
    
    /* #3
     * create a new list to parse throught given list without 
     * breaking current list and coping into new list 
     * 
     */    
    public static list<integer> sortArray(list<integer> numArray){ 
        for(integer i = 0; i < (numArray.size()); i++){//first value in numarr
            for(integer j = i+1; j < (numArray.size()); j++){	//second value in numarr 
                if(numArray[j] < numArray[i]){
                    integer a = numArray[i]; //swap values 
					numArray[i] = numArray[j]; 
                    numArray[j] = a; 
                }  
            }
        }
    	return numArray;              
    }

    // #4
    // factorial n function 
    public static integer factorial(integer n){
        if(n <= 0){
            return 1;//factorial of 0! = 1 
        }else {//continue calling function until n is <= 1 
            return (n*factorial(n-1));
        }    
          
    }
    
    // #5 
    
	public static List<Integer> rotateLeft(List<Integer> arr, Integer n) {
   		//list to insert rotated values 
		list<integer> rotatedList = new list<integer>(); 
		// index to start rotation 
		integer newIndex = math.mod(n, arr.size());
        // start at index and copy elements into new list 
        for(integer a = newIndex; a < arr.size(); a++){
        	rotatedList.add(arr[a]); 
        }
        // add the elements from the begining of the old list up to the new index to the
        // end of the new list  
        for(integer i = 0; i < newIndex; i++ ){
            rotatedList.add(arr[i]); 
        }
    return rotatedList; 
    }
    
    /*  
    public static Boolean balancedBrackets(String brackets) {
        
    }*/
    
    // #7 
    // Method that retrieves all accounts 
    public static void updateAccountSize() {
        // call accounts pu them in a list with fields you want to look at 
		list<Account> sizeAcc = [SELECT Name, size__c, NumberOfEmployees  
                                 FROM Account]; 
        for(Account i : sizeAcc){
            // update desired fields accordingly 
			if(i.NumberOfEmployees <= 1000){
            	i.size__c = 'Small' ; 
            }else if(i.NumberOfEmployees <= 10000 && i.NumberOfEmployees >= 1000){
                i.size__c = 'Medium' ; 
            }else{
            	i.size__c = 'Large' ; 
            }
        }
        // update the accoutns by pushing the list you just created in the query 
		update sizeAcc;   
    }
    
    
    // #8 
    public static void updateCALeads() {
        //Pull leads and fields desired into the leadList 
    	list<Lead> leadList = [SELECT State, Status, Description
                              FROM Lead]; 
        // iterate through lists containing CA 
        for(integer i = 0; i < leadList.size(); i++){
            if(leadList[i].State ==  'CA'){
                leadList[i].Status = 'Closed';
				leadList[i].Description = 'We are no longer doing business in California';  
            }
        }
	update leadList; 
    }
    
    
    
    // #9 
     public static void updateOpportunitiesPastClosedDate() {
         // store opportunities stage in list 
     	list<Opportunity> oppList = [SELECT StageName  
                                     FROM Opportunity 
                                     WHERE NOT Opportunity.StageName = 'Closed Won']; 
         for(integer i = 0; i < oppList.size(); i++){
             oppList[i].StageName = 'Closed Lost';                
         }
	update oppList; 
    }
    
}
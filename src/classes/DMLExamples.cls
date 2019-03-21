public class DMLExamples {
    //This method inserts three account records 
    //updates an existing one 
    
    public static void insertAndUpdateExample(){
        
        list<Account> accountsToInsert = new list<Account>(); 
        
        // Create three account sObjects 
        // We DO NOT want to perform DML on individual sObjects/records
        // so we add to a list 
        for(integer i = 0; i < 3; i++){
            Account a = new Account(Name = 'Wal-Mart' + i, BillingCity = 'San Francisco'); 
            accountsToInsert.add(a); 
        }
        
        Account accountToUpdate; 
        try{
            insert accountsToInsert; 
            
            //update account wal-mart2 
            accountToUpdate = [SELECT BillingCity //what to change 
								FROM Account //where is it 
								WHERE Name = 'Wal-Mart2' //what 
								LIMIT 1]; //how many
           
            system.debug('Wal-Mart2: ' + accountToUpdate); 
             // Update the billing city
            accountToUpdate.BillingCity = 'New York'; 
			
           //actual UPDATE calls database 
            update accountToUpdate; 
        }catch(DMLException e){
        	system.debug('An unexpected error occured:' + e.getMessage()); 
        }
        system.debug('Wal-Mart2: ' + accountToUpdate); 
    }
    
    /* 
     * You can insert records related to existing records if a relationship has already been defiend 
     * between the two objects. A records is associated with a related records through a foreign key id 
     * 
     * This example adds contact to an Account (the related record )
     */ 
    public static void insertRelatedRecords(){
        try{
            Account a = new Account(Name = 'SFDC Account: '); 
            insert a; 
            
            // once account is inserted sObject will be populated with an ID get this ID
            Id aId = a.Id;
            
            // Add a contact to this account 
            Contact c = new Contact (
            			FirstName = 'Pilar', 
						LastName = 'Morales', 
						Phone = '0000000000', 
						AccountId = aId); 
            //insert into databse 
            insert c; 
        }catch(DMLException e){
        	system.debug('An unexpected error occured:' + e.getMessage()); 
        }
    }
    
    
    
    public static void createStudentObject(){
        
        try{
            // create a new class record 
            Class__c discMath = new Class__c(Name = 'Discrete Math', ClassSubject__c = 'Math', Class_Topic__C = 'Algebra');
            	Id  discMathId;
            	insert discMath;
            	discMathID = discMath.id; 
           		
            // create Student 
            Student__c stu1 = new Student__c(Name = 'Pilar', Age__c = 24, Email__c = 'moralespilar@gmail.com'); 
            	insert stu1; 
            	Id stu1Id; 
            	stu1Id = stu1.id; 
            // create Assesment
            id q5Id = '0121U0000002o14QAA'; //quiz ID 
            Assessment__c quiz5 = new Assessment__c(Name = 'Quiz 5', Class__c = discMathId, RecordTypeID = q5Id);
            	insert quiz5; 
            	Id quiz5Id; 
            	quiz5Id = quiz5.Id; 
            	
           	// create grade 
            Grade__c gQuiz5 = new Grade__c(Assessment__c = quiz5Id, Grade__c = 90.00); 
            	insert gQuiz5; 
            // create a new class enrollment 
    		ClassEnrollment__c ce1 = new ClassEnrollment__c(Class__c = discMathId, Student__c = stu1Id); 
            	insert ce1; 
    	}catch(DMLException e){
        	system.debug('An unexpected error occured:' + e.getMessage()); 
        }  
    }
    
    /*
     * Fields on related records can't ba updated with the same call
     * to the DML operation and requiere a seperate DML call 
     * for example, if inserting a new contact, you can specify the contact's 
     * related account record by setting the value wof the AccountId field 
     * However you can't change the account's name without updating the account itself with a seperate DML call 
     * Similarly when updating a contact if you alse want to update 
     * the contacts related account you must make two DML calls 
     * 
     **/ 
    
    public static void updatingRelatedRecords(){
        try{
            // Query for the contact, which has been associated with an account 
            Contact queriedContact = [SELECT Phone, Account.Industry 
                                      FROM Contact 
									  WHERE FirstName = 'Pilar'
                                      AND LastName = 'Morales'
                                      LIMIT 1]; 
            //Update the contact's phone number 
            queriedContact.Phone = '1111111111'; 
            
            //Update the related account industry 
            queriedContact.Account.Industry = 'Technology'; 
            
            //make two seperate calls 
            //1. THis call is to Update the contacts phone 
            update queriedContact; 
            // 2. Thsi call is to update the industry 
            update queriedContact.Account; 
        }catch(DMLException e){
        	system.debug('An unexpected error occured:' + e.getMessage()); 
        }  
    }
    
    /*
     * Using the upsert operation you can either insert or update an existing 
     * record in one call. TO determine whether a record already existis the upsert statement 
     * or DAtabase method uses the record's id as the key to match records, a custom external id, 
     * or a standard field with the idLookup sttribute set to true 
     * 
     * - if the key isn't matched then a new record is created 
     * - if the key ia matched once, then the record is updated 
     * - if the key is matched multiple times, then an error is generated and the onject 
     * 		is niether inserted or updated 
     * 
     * */
    public static void upsertExample(){
        List<Account> accountList = [SELECT BillingCity 
                                     FROM Account 
                                     WHERE BillingCity = 'San Francisco']; 
     
		for(Account a : accountList){
			a.BillingCity = 'Mumbai'; 
		}
		
        Account a = new Account(Name = 'Acme', BillingCity = 'San Francisco'); 
        accountList.add(a); 
        
        try{
            upsert accountList; 
        }catch(DMLException e){
        	system.debug('An unexpected error occured:' + e.getMessage()); 
        }  
    }
    
    /*
     * Only available for lead, contact or account record 
     * Can merge up to three records of the same sObject type 
     * The merge operation merges up tp three records into one of the records 
     * deletes the others, and represents any related records 
     * 
     * */
    public static void mergeExample(){
        //Insert new Accounts 
        List<Account> ls = new List<Account> { new Account (Name = 'Dunkin Inc.'), 
            								   new Account (Name = 'Dunkin')}; 
                                                   
        insert ls; 
        
        //Queries to get the inserted accounts 
        Account masterAccount = [SELECT Id, Name FROM Account WHERE Name = 'Dunkin Inc.' LIMIT 1]; 
        Account mergeAccount = [SELECT Id, Name FROM Account WHERE Name = 'Dunkin' LIMIT 1]; 
        
        //Add a contact tot he account to be merged 
        Contact c = new Contact(FirstName = 'Pilar', LastName = 'Morales'); 
        c.AccountId = mergeAccount.Id; 
        insert c; 
        
        Account[] result = [SELECT Id, Name FROM Account WHERE Name LIKE '%Dunkin%']; 
        system.debug('Before merge:' + result);
        
        try{
            merge masterAccount mergeAccount; 
        }catch(DMLException e){
        	system.debug('An unexpected error occured:' + e.getMessage()); 
        }
        
        Account[] res = [SELECT Id, Name FROM Account WHERE Name LIKE '%Dunkin%']; 
        system.debug('After merge:' + res);
    }
    
    /*
     * You can delete records using the delete records using the dlete operation 
     * Deleted records aren't deleted permenantly from salesforce 
     * but they are placed in the recycle bin fpr 15 days where they can be restored
     * 
     * */
    public static void deletedExample(){
        insert new Account(Name = 'DotCom'); 
        Account [] doomedAccounts = [SELECT Name FROM Account WHERE Name = 'DotCom']; 
        System.debug('Doomed Accounts: ' + doomedAccounts); 
        
        try{
            delete doomedAccounts; 
        }catch(DMLException e){
        	system.debug('An unexpected error occured:' + e.getMessage()); 
        }

		System.debug('Doomed Accounts: ' + [SELECT Name FROM Account WHERE Name = 'DotCom']); 
    }
    
    public static void undeleteExample(){
        //ALL ROWS includes recently deleted and archived
        Account [] savedAccounts = [SELECT Name FROM Account WHERE Name = 'DotCom' ALL ROWS];  
        System.debug('savedAccounts ' + savedAccounts);
        try {
            undelete savedAccounts; 
        }catch(DMLException e){
        	system.debug('An unexpected error occured:' + e.getMessage()); 
        }
        system.debug('Saved Accouts ' + [SELECT Name FROM Account WHERE Name = 'DotCom'] );
    }
    
    public static void queryForLoop(){
        List<Account> accountList = [SELECT id, Name FROM Account LIMIT 5];
        //only use if wanting to access data later 
        for(Account a : accountList){
            system.debug('a: ' + a );
        }
        //better practice no allocation of memory cost efficient 
        //Use when don't need to access the data again 
        for(Account a : [SELECT id, Name FROM Account LIMIT 5 ]){
            System.debug('a: ' + a);
        }
    }
    
    public static void dataBaseClass(){
        List<Account> accList = new List<Account> (); 
        accList.add(new Account(Name = 'Acme1')); 
		accList.add(new Account(Name = 'Acme2')); 
		accList.add(new Account()); 
        
        //DML statement using Database Class 
        Database.SaveResult[] srList = DataBase.insert(accList, false); 
        
        for(Database.SaveResult sr : srList){
            if(sr.isSuccess()){
                System.debug('Successfully inserted Account. Account ID: ' + sr.getId());
            }else{
                for(Database.Error err : sr.getErrors()){
                    system.debug('The following error has occured. ');
                    system.debug(err.getStatusCode() + ': ' + err.getMessage());
                    system.debug('Accounts fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
}
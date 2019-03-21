trigger ContactTrigger on Contact (before insert, after insert, before update) {
    if(Trigger.isAfter && Trigger.isInsert){
        PostToChatterContact.postChatterContact(Trigger.new);
    }else if(Trigger.isBefore && Trigger.isInsert){
        DuplicateChecker.checkForContactDuplicates(Trigger.new);       
    }
    
    /*
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            //do stuff 
        }
    }else {
        if(Trigger.isInsert){
           PostToChatterContact.postChatterContact(Trigger.new); 
        }
    }*/
     	
}
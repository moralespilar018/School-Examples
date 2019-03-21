trigger ClassEnrollmentTrigger on ClassEnrollment__c (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        ClassEnrollmentGrades.setExistingAssesmentGradesToDefault(trigger.new); 
    }
}
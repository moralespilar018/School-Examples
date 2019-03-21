trigger AssessmentTrigger on Assessment__c (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        ClassEnrollmentGrades.setStudentGrades(Trigger.new);
    }
}
trigger JobPostingCloner on Job_Posting__c (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        JobPostingCloner.deepCloner(Trigger.new);
    }
}
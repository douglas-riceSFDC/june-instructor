public with sharing class ProjectController {

    @AuraEnabled
    public static Project__c getProject(Id projectId) {
        try {
            return [
                SELECT Id, Name, Project_Manager__r.Name
                FROM Project__c
                WHERE Id = :projectId
                LIMIT 1
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
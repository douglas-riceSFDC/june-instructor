public with sharing class ProjectDuplicateChecker {
    
    @InvocableMethod
    public static List<Project__c> checkForDuplicateProjects(List<DuplicateParameter> params) {
        System.debug('Called Dupe checker');
        List<Project__c> insertedProjects = new List<Project__c>();

        return insertedProjects;

        // List<Contact> newProjectManager = new List<Contact>();
        // newProjectManager = [SELECT Id
        //                         FROM Contact  
        //                         WHERE Name LIKE '%Doug%' LIMIT 1];
        
        // if(newProjectManager.size() > 0) {
        //     for(Project__c p : insertedProjects) {
        //         p.Project_Manager__c = newProjectManager[0].Id;
        //     }        
        // }

        // update insertedProjects;

    }

    public class DuplicateParameter {

        @InvocableVariable
        public List<Project__c> projects;

        @InvocableVariable
        public List<Timecard__c> timecards;

        @InvocableVariable
        public List<Contact> contacts;

    }
}
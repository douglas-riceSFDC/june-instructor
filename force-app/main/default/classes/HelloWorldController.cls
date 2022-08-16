public with sharing class HelloWorldController {
    private Timecard__c timecard;

    public HelloWorldController(ApexPages.StandardController stdController) {
        this.timecard = [SELECT Name, Project_Manager__r.Name 
                            FROM Timecard__c 
                            WHERE Id = :stdController.getId()];
    }

    public String getWelcome() {
        return 'Welcome to ' + timecard.Name + '! Your Project Manager is ' + timecard.Project_Manager__r.Name;
    }

    public List<String> getStrings() {
        return new List<String>{'ONE', 'TWO', 'THREE'};
    }
}
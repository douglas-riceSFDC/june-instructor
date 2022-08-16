public with sharing class ScheduledTaskGenerator implements Schedulable {

    public void execute(SchedulableContext SC) {
        List<Timecard__c> timecardsNeedingTasks = new List<Timecard__c>();
        timecardsNeedingTasks = [SELECT Id
                                    FROM Timecard__c
                                    WHERE CreatedDate = :Date.today().addDays(-7)];

        List<Task> generatedTasks = new List<Task>();
        for(Timecard__c t : timecardsNeedingTasks) {
            Task reminder = new Task();
            reminder.WhatId = t.Id;
            reminder.Subject = 'Submit Your Timecard!';
            reminder.ActivityDate = Date.today().addDays(1);

            generatedTasks.add(reminder);
        }

        insert generatedTasks;
    }

}
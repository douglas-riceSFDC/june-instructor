EmailTemplate temp = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'Survey_Invitation_2'];
ConnectApi.SurveyInvitationEmailInput params = new ConnectApi.SurveyInvitationEmailInput();
params.allowGuestUserResponse = true;
params.allowParticipantsAccessTheirResponse = false;
params.collectAnonymousResponse = false;
params.fromEmailAddress = 'douglas.rice@salesforce.com';
params.isPersonalInvitation = false;
params.recipients = new List<String>{'0030400000UOYHtAAP', '0030400000UcvZKAAZ'};
params.emailTemplateId = temp.Id;

Id surveyID = '0Kd040000008Ob7CAE';
ConnectApi.Surveys.sendSurveyInvitationEmail(surveyID, params);


Program_Task__c task = new Program_Task__c();
task.Name = 'Test Task';
task.Program__c = '';
task.Days_to_Complete__c = 10;
task.Task_List__c = '';
task.Estimated_Minutes_to_Complete__c = 120;

insert task;

Name
Program
Days to Complete
Task List
Estimated Minutes to Complete
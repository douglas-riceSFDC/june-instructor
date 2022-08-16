public with sharing class JobPostingCloner {
    public static Job_Posting__c deepCloner (Job_Posting__c request) {
        if(checkbox == true) {
            // Creates a new posting and copies fields from parameter job posting
            Job_Posting__c newPosting = new Job_Posting__c();
            newPosting.Job_Title__c = request.Job_Title__c;
            newPosting.Name = request.Name;
            newPosting.Salary__c = request.Salary__c;
            insert newPosting;
            // Querys stages that have the same Id as the parameter job posting
            List<Interview_Stage__c> stages = [SELECT Id
                                                FROM Interview_Stage__c
                                                WHERE Job_Posting__c = :request.Id];
            
            // Creates new list to insert new interview stages that copy fields from the cloned stages
            // newStage is inserted into list and given a fresh Id when inserted
            // Creates map to link old stage Ids and new stages
            List<Interview_Stage__c> stageListToInsert = new List<Interview_Stage__c>();
            Map<Id, Interview_Stage__c> oldStageIdMap = new Map<Id, Interview_Stage__c>();
            for (Interview_Stage__c s : stages) {
                Interview_Stage__c newStage = new Interview_Stage__c();
                newStage.Name = s.Name;
                newStage.Description__c = s.Description__c;
                newStage.Interview_Type__c = s.Interview_Type__c;
                newStage.Job_Posting__c = newPosting.Id;
                stageListToInsert.add(newStage);
                oldStageIdMap.put(s.Id, newStage);
            }
            insert stageListToInsert;
            // Querys interviewers that match interview stage id
            List<Interviewer__c> interviewers = new List<Interviewer__c>();
            for (Interview_Stage__c s : stages) {
                interviewers = [SELECT Id FROM Interviewer__c WHERE Interview_Stage__c = :s.Id];
            }
            // Creates new list to insert new interviewers that copy fields from the cloned interviewers
            // newInterviewer is inserted into list and given a fresh Id when inserted
            List<Interviewer__c> interviewerListToInsert = new List<Interviewer__c>();
            for (Interviewer__c i : interviewers) {
                Interviewer__c newInterviewer = new Interviewer__c();
                newInterviewer.Contact__c = i.Contact__c;
                newInterviewer.Name = i.Name;
                newInterviewer.Additional_Interviewers__c = i.Additional_Interviewers__c;
                newInterviewer.Interview_Stage__c = oldStageIdMap.get(i.Interview_Stage__c).Id;
                interviewerListToInsert.add(newInterviewer);
            }
            insert interviewerListToInsert;
            
            // Querys interview questions that match interview stage id
            List<Interview_Question__c> questions = new List<Interview_Question__c>();
            for (Interview_Stage__c s : stages) {
                questions = [SELECT Id FROM Interview_Question__c WHERE Interview_Stage__c = :s.Id];
            }
            // Creates new list to insert new questions that copy fields from the cloned questions
            // newQuestion is inserted into list and given a fresh Id when inserted
            List<Interview_Question__c> questionsToInsert = new List<Interview_Question__c>();
            for (Interview_Question__c q : questions) {
                Interview_Question__c newQuestion = new Interview_Question__c();
                newQuestion.Interview_Feedback__c = q.Interview_Feedback__c;
                newQuestion.Name = q.Name;
                newQuestion.Question_and_Details__c = q.Question_and_Details__c;
                newQuestion.Interview_Stage__c = oldStageIdMap.get(q.Interview_Stage__c).Id;
                questionsToInsert.add(newQuestion);
            } 
            
            insert questionsToInsert;
            // Does this need a return value, if newPosting is inserted?
            return newPosting;

        }
    }
}

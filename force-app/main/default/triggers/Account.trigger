trigger Account on Account (before update) {
    for(Account a : Trigger.new) {
        if(a.Test_Increment__c == null) 
            a.Test_Increment__c = 0;
        
        a.Test_Increment__c ++;

    }
}
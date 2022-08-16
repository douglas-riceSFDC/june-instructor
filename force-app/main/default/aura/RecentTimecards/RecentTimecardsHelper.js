({
    queryRecentTimecards : function(component, helper) {
        var action = component.get('c.getRecentTimecards');
        var projectId = component.get('v.recordId');
        
        action.setParams({ projectId: projectId });

        action.setCallback(this, function(response) {
            if(response.getState() === 'SUCCESS') {
                var timecards = response.getReturnValue(); 

                console.log('aura timecards');
                console.log(timecards);

                component.set('v.timecards', timecards);
            }
            else {
                // error handling
            }
        });

        $A.enqueueAction(action);
    },
})
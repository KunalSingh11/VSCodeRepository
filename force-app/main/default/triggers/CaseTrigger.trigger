trigger CaseTrigger on Case (after insert) {
    
    List<High_Priority_Case__e> eventList = new List<High_Priority_Case__e>();
    
    for(Case c: Trigger.NEW){
        if(c.Priority == 'High'){
            High_Priority_Case__e event = new High_Priority_Case__e();
            event.Case_Number__c = c.CaseNumber;
            event.Subject__c = c.Subject;
            event.Priority__c = c.Priority;
            eventList.add(event);
        }
    }
    
    if (!eventList.isEmpty()) {
        EventBus.publish(eventList);
        System.debug('High Priority Case Event Published: ' + eventList);
    }
    
}
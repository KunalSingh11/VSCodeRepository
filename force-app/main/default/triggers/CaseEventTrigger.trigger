trigger CaseEventTrigger on High_Priority_Case__e (after insert) {
    
    List<Task> taskList = new List<Task>();
    List<Messaging.SingleEmailMessage> emails  = new List<Messaging.SingleEmailMessage>();
    
    for(High_Priority_Case__e event:Trigger.NEW){
        Task t = new Task();
        t.Subject = 'Follow up on High-Priority Case: ' + event.Case_Number__c;
        t.Priority = 'High';
        t.Status = 'Not Started';
        t.OwnerId = UserInfo.getUserId();
        taskList.add(t);
    }
    
    for(High_Priority_Case__e event:Trigger.NEW){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'kunal070598@gmail.com'}); // Send to Support Manager
        mail.setSubject('High Priority Case: ' + event.Case_Number__c);
        mail.setPlainTextBody(
            'A high-priority case has been created.\n\n' +
            'Subject: ' + event.Subject__c
        );
        emails.add(mail);
    }
    
    if(!taskList.isEmpty()){
        INSERT taskList;
    }
    
    if (!emails.isEmpty()) {
        Messaging.sendEmail(emails);
        System.debug('Emails sent to support team');
    }
}
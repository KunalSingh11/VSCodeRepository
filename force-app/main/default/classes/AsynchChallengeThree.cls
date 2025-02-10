public with sharing class AsynchChallengeThree implements Schedulable {
    public void execute(SchedulableContext SC) {

        List<Lead> leadList = [SELECT Id, Name FROM Lead WHERE OwnerId = NULL];

        String johnDoeId ;
        User JohnDowUserrECORD = [SELECT Id FROM User WHERE Name = 'John Doe' limit 1];
        johnDoeId = JohnDowUserrECORD.Id;

        for(Lead l: leadList){
            l.OwnerId = johnDoeId;
        }

        if(!leadList.isEmpty()){
            UPDATE leadList;
        }
    }
}
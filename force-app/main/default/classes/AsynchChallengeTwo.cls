
public with sharing class AsynchChallengeTwo implements Database.Batchable<SObject>{

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, CaseNumber, ClosedDate, IsArchived__c FROM Case WHERE ClosedDate >= LAST_N_YEARS:2');
    }

    public void execute(Database.BatchableContext BC, List<Case> cList){
        if(!cList.isEmpty()){
            for(Case c: cList){
                c.IsArchived__c = true;
            }
            try{
                UPDATE cList;
            }
            catch(Exception e){
                System.debug('Error Updating Case Records! '+e.getMessage());
            }
        }
    }

    public void finish(Database.BatchableContext BC){
        System.debug('Batch Job Completed!');
    }
}
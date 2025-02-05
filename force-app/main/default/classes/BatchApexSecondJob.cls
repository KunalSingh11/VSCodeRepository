public with sharing class BatchApexSecondJob implements Database.Batchable<SObject>{
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, lastName FROM Contact');
    }

    public void execute(Database.BatchableContext BC, List<Contact> conList){
        for(Contact con: conList){
            con.lastName +=' - Updated via Batch';
        }
        if(!conList.isEmpty()){
            UPDATE conList;
        }
    }

    public void finish(Database.BatchableContext BC){
        System.debug('Second Batch Job Completed.');
    }
}
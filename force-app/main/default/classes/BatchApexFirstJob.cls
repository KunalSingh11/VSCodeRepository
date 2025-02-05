public with sharing class BatchApexFirstJob implements Database.Batchable<SObject>{

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, Name FROM Account');
    }

    public void execute(Database.BatchableContext BC, List<Account> accList){
        for(Account acc: accList){
            acc.Name +=' - Updated via Batch';
        }
        if(!accList.isEmpty()){
            UPDATE accList;
        }
    }

    public void finish(Database.BatchableContext BC){
        Database.executeBatch(new BatchApexSecondJob(),1);
        System.debug('First Batch Job Completed.Starting Second Job...');
    }
}
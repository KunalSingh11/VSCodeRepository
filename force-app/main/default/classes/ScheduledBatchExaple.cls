public with sharing class ScheduledBatchExaple implements Database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, Name, LastModifiedDate FROM ACCOUNT WHERE LastModifiedDate < LAST_N_YEARS:1 ');
    }
    public void execute(Database.BatchableContext BC, List<Account> accList)
    {
        for(Account acc: accList){
            acc.Name +=' - Inactive';
        }
        UPDATE accList;
    }
    public void finish(Database.BatchableContext BC){
        System.debug('Batch Processing  Complete');
    }
}
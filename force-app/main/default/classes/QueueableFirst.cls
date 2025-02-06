public with sharing class QueueableFirst implements Queueable {
    public void execute (QueueableContext qc) {
        List<Account> accList = [SELECT Id, Name FROM Account];
        for(Account acc: accList){
            acc.Name += ' - UpdatedViaQueueable';
        }

        if(!accList.isEmpty()){
            UPDATE accList;
        }
        System.debug('Completed First Queueable Job');
        //System.enqueueJob(new QueueableSecond());//
    }
}
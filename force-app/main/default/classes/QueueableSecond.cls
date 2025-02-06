public with sharing class QueueableSecond implements Queueable{
    public void execute(QueueableContext qc) {
        List<Contact> conList = [SELECT Id, Name FROM Contact];
        for(Contact con: conList){
            con.lastName += ' - UpdatedviaQueueableSecond';
        }
        if(!conList.isEmpty()){
            UPDATE conList;
        }
        System.enqueueJob(new QueueableSecond());
        System.debug('Completed Second Queueable Job');
    }
}
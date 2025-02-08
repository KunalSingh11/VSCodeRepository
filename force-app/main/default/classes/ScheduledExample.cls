public with sharing class ScheduledExample implements Schedulable{
    public void execute(SchedulableContext SC) {
        Database.executeBatch(new ScheduledBatchExaple());
    }
}
public with sharing class AsynchChallengeOne implements Queueable {
    public void execute(QueueableContext qc) {

        List<Opportunity> oppList = [SELECT Id, Name, Amount FROM Opportunity 
                                     WHERE Amount > 500000 
                                     LIMIT 50000]; // Avoid SOQL row limit error
        
        if (!oppList.isEmpty()) {
            for (Opportunity opp : oppList) {
                opp.StageName = 'Executive Review';
            }
            
            try {
                update oppList; // Bulk update
            } catch (DmlException e) {
                System.debug('Error updating Opportunities: ' + e.getMessage());
            }
        }
    }
}
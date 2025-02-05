public with sharing class FutureMethodExample {
    @future
    public static void UpdateConAsynch(){
        List<Account> accList = [SELECT ID, Name FROM Account];
        for(Account  acc: accList){
            acc.Description += 'Updated via @future';
        }
        if(!accList.isEmpty()){
            UPDATE accList;
        }
        System.debug('Successfully updated '+accList.size()+' account records using future method');
    }
}
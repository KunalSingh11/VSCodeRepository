Some Challenges...

📝 Challenge 1: Queueable Apex - Update High-Value Opportunities
Scenario:
Your company wants to automatically update Opportunities with an Amount greater than $500,000 and set the StageName to "Executive Review".

🛠 Task:
Write a Queueable Apex class to find all Opportunities where Amount > 500000.
Update their StageName to "Executive Review".
Execute the Queueable job using System.enqueueJob().

📝 Challenge 2: Batch Apex - Archive Old Cases
Scenario:
Support wants to archive all closed Cases older than 2 years by setting IsArchived__c = true.

🛠 Task:
Write a Batch Apex class that:
Retrieves Cases older than 2 years.
Updates IsArchived__c = true.
Execute the batch job with a batch size of 200 records per batch.
Log the number of records processed in finish().

 Challenge 3: Scheduled Apex - Auto-Assign Leads
Scenario:
Sales wants a scheduled job to run daily at midnight and assign unassigned Leads to a default Sales Rep (Assigned_To__c = 'John Doe').

🛠 Task:
Write a Schedulable Apex class that:
Finds all Leads where OwnerId is null.
Assigns them to John Doe.
Schedule the job to run every day at midnight (0 0 0 * * ?).

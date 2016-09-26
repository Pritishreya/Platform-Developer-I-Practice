public with sharing class DynamicApexPractice {
    
    /*  This method will tell you how you can get object & field level details for pre identified objects.
        I choose 'Account' Object for this method
    */ 
    public static void practiceDynamicApexWithPreIdentifiedSObject(){
        //Step 1. Generate a list or map of tokens for the sObjects in your organization
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        
        //Step 2. Determine the sObject you need to access.
        //Step 3. Generate the describe result for the sObject.
        //For this I choose standard SObject - Account
        Schema.DescribeSObjectResult[] results = Schema.describeSObjects(new String[]{'Account'});
        
        //Step 4. Generate a map of field tokens for the sObject - Account
        Map<String, Schema.SObjectField> fm = Schema.SObjectType.Account.fields.getMap();
        
        //Step 5. Accessing the fields
        for(String token : fm.keyset()){
            System.Debug('-- Field Name: ' + fm.get(token).getDescribe().getName() + '  Field Label: ' + fm.get(token).getDescribe().getLabel());
        }
    }
}
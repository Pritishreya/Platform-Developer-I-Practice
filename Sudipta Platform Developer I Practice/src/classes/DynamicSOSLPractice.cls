public with sharing class DynamicSOSLPractice {
    /*
        This method will prepare SOSL statement to search for the keyword in all the fields for the objects
        Account, Lead, Contact, sudipta__Book__c
    */
    public static void testDynamicSOSL(){
        String soslString = '';
        String searchKeyword = 'Salesforce';
        
        List<String> requiredsObjects = new List<String>{'Account', 'Lead', 'Contact','sudipta__Book__c'};
        List<Schema.DescribeSObjectResult> results = Schema.describeSObjects(requiredsObjects);
        
        for(Schema.DescribeSObjectResult res : results){
            soslString += res.getName() + '(';
            for(Schema.SObjectField singleField : res.fields.getMap().values()){
                soslString = soslString + singleField.getDescribe().getName() + ',';
            }
            soslString = soslString.subString(0,soslString.length()-1);
            soslString += '),';
        }
        
        soslString = soslString.subString(0,soslString.length()-1);
        System.Debug('-- soslString: ' + soslString);
        
        soslString = 'FIND \'*' + searchKeyword + '*\' IN ALL FIELDS RETURNING ' + soslString;
        System.Debug('-- Final SOSLQueryString: ' + soslString);
        
        //Execute the sosl query
        List<List<sObject>> searchResult = search.query(soslString);
        
        //Iterate the sosl result
        for(List<sObject> sObjectSearchResult : searchResult){
            //Print the values 
        }
        
    }
}
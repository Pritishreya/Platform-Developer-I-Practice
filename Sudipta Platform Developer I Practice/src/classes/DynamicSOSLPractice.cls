public with sharing class DynamicSOSLPractice {
    public static void testDynamicSOSL(){
        String soslString = '';
        
        List<String> requiredsObjects = new List<String>{'Account', 'Lead', 'Contact','sudipta__Book__c'};
        List<Schema.DescribeSObjectResult> results = Schema.describeSObjects(requiredsObjects);
        for(Schema.DescribeSObjectResult res : results){
            System.Debug(' -- OBJECT Name: ' + res.getName());
        }
        
    }
}
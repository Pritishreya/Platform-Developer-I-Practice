/*  This is the class to practice Schema Class Methods 
    Link: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_schema.htm
*/
public with sharing class SchemaClassPractice {
    
    /*  Practice the method - getGlobalDescribe()
        Description: Returns a map of all sObject names (keys) to sObject tokens (values) for the standard and custom objects defined in your organization.
    */
    public static void practiceGlobalDescribe(){
        Map<String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();
        for(String sObjectName : globalDescribe.keySet()){
            System.Debug('-- sObjectName: ' + sObjectName + ' Token/Value: ' + globalDescribe.get(sObjectName));
        }
    }
}
public with sharing class DynamicSOQLPractice {
    public static void getAccountFieldsDynamically(){
        String allFields = '';
        List<Account> allAccounts;
        
        Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
        for(Schema.SObjectField singleField : fieldMap.values()){
            allFields = allFields + ',' + singleField.getDescribe().getName();
        }
        
        System.Debug('-- FIELDS: ' + allFields);
    }
}
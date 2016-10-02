public with sharing class DynamicSOQLPractice {
    public static void getAccountFieldsDynamically(){
        String fields = '';
        List<Account> allAccounts;
        
        Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
        for(Schema.SObjectField singleField : fieldMap.values()){
            fields = fields + singleField.getDescribe();
        }
        
        System.Debug('-- FIELDS: ' + fields);
    }
}
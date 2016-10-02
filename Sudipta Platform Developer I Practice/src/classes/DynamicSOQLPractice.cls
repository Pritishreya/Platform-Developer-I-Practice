public with sharing class DynamicSOQLPractice {
    public static void getAccountFieldsDynamically(){
        String allFields = '';
        List<Account> allAccounts;
        
        Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
        for(Schema.SObjectField singleField : fieldMap.values()){
            allFields = allFields + ',' + singleField.getDescribe().getName();
        }
        
        //Remove the last ',' from allFields
        allFields = allFields.subString(1,allFields.length());
        System.Debug('-- FIELDS: ' + allFields);
        
        String queryString = 'SELECT ' + allFields + ' FROM ACCOUNT';
        System.Debug('-- QUERY: ' + queryString);
        if(!String.isBlank(queryString)){
            allAccounts = Database.query(queryString);
        }
        
        /*
        if(allAccounts.size() > 0){
            System.Debug('--ACCOUNT FETCHED: ' + allAccounts.size());
        }
        */
    }
}
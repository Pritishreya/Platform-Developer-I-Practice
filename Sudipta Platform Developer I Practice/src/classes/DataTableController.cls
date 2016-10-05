public with sharing class DataTableController {
    /** 
    * @description       Returns the set of columns to be rendered by the data tables
    * @param             N/A
    * @return            Parsed JSON string of columns / properties
    */ 
    public String getColumns() {
        List<Map<String, String>> cols = new List<Map<String, String>>();
        List<sudipta__Search_Columns__c> allSearchColumns = [SELECT
                                                                sudipta__Field__c,
                                                                sudipta__Name__c,
                                                                sudipta__Object__c
                                                             FROM sudipta__Search_Columns__c
                                                            ];
        //Iterate through the columns defined in the custom settings
        for(sudipta__Search_Columns__c singleSearchColumn : allSearchColumns){
            String searchFieldLabel = getFieldLabel(singleSearchColumn.sudipta__Object__c, singleSearchColumn.sudipta__Field__c);
            cols.add(
                new Map<String, String>{
                    'data'                  =>  singleSearchColumn.sudipta__Object__c + '.' + singleSearchColumn.sudipta__Field__c,
                    'title'                 =>  singleSearchColumn.sudipta__Name__c,
                    'fieldApiName'          =>  singleSearchColumn.sudipta__Field__c,
                    'defaultContent'        =>  '',
                    'isReference'           =>  'false',
                    'isDate'                =>  'false',
                    'isDateTime'            =>  'false'
                }
            );
        }
        
        return JSON.serialize(cols);
    }
    
    public String getFieldLabel(String objectName, String fieldName){
        String fieldLabel = '';
        try{
            fieldLabel = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap().get(fieldName).getDescribe().getLabel();
        }catch(Exception e){
            System.Debug('Error fetching the Field: ' + fieldName + ' From Object: ' + objectName + ' Error Message: ' + e.getMessage());
        }
        return fieldLabel;
    }
}
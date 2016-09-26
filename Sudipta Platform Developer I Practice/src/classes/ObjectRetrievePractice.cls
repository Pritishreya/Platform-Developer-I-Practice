public with sharing class ObjectRetrievePractice {
    public String selectedObject{get;set;}
    public List<SelectOption> allFieldNames{get;set;}
    
    public List<SelectOption> getAllObjNames(){
        //Get all Object names
		List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
		List<SelectOption> options = new List<SelectOption>();
		options.add(new SelectOption('--None','--None--'));
		
		for(Schema.SObjectType f : gd){
		    options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
		}
		return options;
	}
	
	public List<SelectOption> getAllCustomObjNames(){
        //Get all Object names
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--None','--None--'));
        
        for(Schema.SObjectType f : gd){
            if(f.getDescribe().getName().contains('__c'))
                options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
        }
        return options;
    }
    
    public List<SelectOption> getAllFieldNames(){
        allFieldNames = new List<SelectOption>();
        System.Debug('-- selectedObject: ' + selectedObject);
        if(selectedObject != null && selectedObject != ''){
            Map<String, Schema.SObjectType> m1 = Schema.getGlobalDescribe() ;
            SObjectType objToken1 = m1.get(selectedObject);
            DescribeSObjectResult objDef1= objToken1.getDescribe();
            Map<String, SObjectField> fieldmap = objDef1.fields.getmap();
            for (String fName1:fieldmap.keySet()){
                allFieldNames.add(new SelectOption(fieldmap.get(fName1).getDescribe().getName(),fieldmap.get(fName1).getDescribe().getName()));
            }
        }
        return allFieldNames;
    }
}
public with sharing class ObjectRetrievePractice {
    public String objectName { get; set; } 
    public list<SelectOption> lsps{get;set;}  
    public String fields { get; set; }
    
    //Method to fetch all objects present in the org
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
	
	//Method to fetch only custom objects from the org
	public List<SelectOption> getAllCustomObjNames(){
        //Get all Object names
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--None','--None--'));
        
        for(Schema.SObjectType f : gd){
            if(f.getDescribe().isCustom())
                options.add(new SelectOption(f.getDescribe().getLabel(),f.getDescribe().getLabel()));
        }
        return options;
    }
    
    //Method to fetch Account fields dynamically
    public List<SelectOption> getAllAccountFields(){
        List<SelectOption> options = new List<SelectOption>();
        
        Map<String, Schema.SObjectField> fm = Schema.SObjectType.Account.fields.getMap();
        
        for(String token : fm.keyset()){
            options.add(new SelectOption(fm.get(token).getDescribe().getLabel(),fm.get(token).getDescribe().getLabel()));
        }
        return options;
    }
    
    //Method to fetch Required fields from Account object dynamically
    public List<SelectOption> getAllAccountRequiredFields(){
        List<SelectOption> options = new List<SelectOption>();
        
        Map<String, Schema.SObjectField> fm = Schema.SObjectType.Account.fields.getMap();
        
        for(String token : fm.keyset()){
            Schema.DescribeFieldResult describeResult = fm.get(token).getDescribe();
            if(describeResult.isCreateable() && !describeResult.isNillable() && !describeResult.isDefaultedOnCreate()){
                options.add(new SelectOption(describeResult.getLabel(),describeResult.getLabel()));
            }
        }
        return options;
    }
    
    //Method to fetch fields dynamically from the selected objects  
    public void fetchFields() {
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        lsps = new List<SelectOption>();
        
        if(objectName!=null || objectName!=''){
            Map<string,Schema.SObjectField> mpConField=schemaMap.get(objectName).getDescribe().fields.getMap();
            
            for(String token : mpConField.keyset()){
	            lsps.add(new SelectOption(mpConField.get(token).getDescribe().getLabel(),mpConField.get(token).getDescribe().getLabel()));
            }
        }        
    }
}
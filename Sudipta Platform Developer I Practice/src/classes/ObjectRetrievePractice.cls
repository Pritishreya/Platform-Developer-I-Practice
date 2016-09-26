public with sharing class ObjectRetrievePractice {
    public String selectedObject{get;set;}
    public List<SelectOption> allFieldNames{get;set;}
    
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
        Schema.DescribeSObjectResult[] results = Schema.describeSObjects(new String[]{'Account'});
        Map<String, Schema.SObjectField> fm = Schema.SObjectType.Account.fields.getMap();
        for(String token : fm.keyset()){
            System.Debug('-- Field Name: ' + fm.get(token).getDescribe().getName() + '  Field Label: ' + fm.get(token).getDescribe().getLabel());
            options.add(new SelectOption(fm.get(token).getDescribe().getLabel(),fm.get(token).getDescribe().getLabel()));
        }
        return options;
    }
    
    public List<SelectOption> getAllFieldNames(){
        allFieldNames = new List<SelectOption>();
        System.Debug('-- selectedObject: ' + selectedObject);
        if(selectedObject != null && selectedObject != '--None--'){
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
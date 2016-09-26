public with sharing class ObjectRetrievePractice {
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
            options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
        }
        return options;
    }
}
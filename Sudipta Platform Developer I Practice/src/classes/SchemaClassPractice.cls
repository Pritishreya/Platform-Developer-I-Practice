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
    
    /*  Practice the method - describeSObjects(sObjectTypes)
        Description: Describes metadata (field list and object properties) for the specified sObject or array of sObjects.
        Usage:  This method is similar to the getDescribe method on the Schema.sObjectType token. Unlike the getDescribe method, this method allows you to specify the sObject type 
                dynamically and describe more than one sObject at a time.
                You can first call getGlobalDescribe to retrieve a list of all objects for your organization, then iterate through the list and use describeSObjects to obtain 
                metadata about individual objects.
    */
    public static void practiceDescribeSObjects(){
        Schema.DescribeSObjectResult[] descResults = Schema.describeSObjects(new String[]{'Account', 'Contact'});
        for(Schema.DescribeSObjectResult singleDescResult : descResults){
            System.Debug('-- Name: ' + singleDescResult.getName() + ' Label: ' + singleDescResult.getlabel());
            //Indicates whether the object has subtypes. The Account object, which has subtype PersonAccount, is the only object that will return true.
            //System.Debug('-- Has Sub Type: ' + singleDescResult.getHasSubtypes());
        }
    }
    
    /*  Practice the method - practiceDescribeTabs()
        Description: Returns information about the standard and custom apps available to the running user.
    */
    public static void practiceDescribeTabs(){
        List<Schema.DescribeTabSetResult> tabSetDesc = Schema.describeTabs();
        
        // Iterate through each tab set describe for each app and display the info
		for(DescribeTabSetResult tsr : tabSetDesc) {
		    String appLabel = tsr.getLabel();
		    System.debug('Label: ' + appLabel);
		    System.debug('Logo URL: ' + tsr.getLogoUrl());
		    System.debug('isSelected: ' + tsr.isSelected());
		    String ns = tsr.getNamespace();
		    if (ns == '') {
		        System.debug('The ' + appLabel + ' app has no namespace defined.');
		    }
		    else {
		        System.debug('Namespace: ' + ns);
		    }
		    
		    // Display tab info for the Sales app
		    if (appLabel == 'Sales') {
		        List<Schema.DescribeTabResult> tabDesc = tsr.getTabs();
		        System.debug('-- Tab information for the Sales app --');
		        for(Schema.DescribeTabResult tr : tabDesc) {
		            System.debug('getLabel: ' + tr.getLabel());
		            System.debug('getColors: ' + tr.getColors());
		            System.debug('getIconUrl: ' + tr.getIconUrl());
		            System.debug('getIcons: ' + tr.getIcons());
		            System.debug('getMiniIconUrl: ' + tr.getMiniIconUrl());
		            System.debug('getSobjectName: ' + tr.getSobjectName());
		            System.debug('getUrl: ' + tr.getUrl());
		            System.debug('isCustom: ' + tr.isCustom());
		        }
		    }
		}
    }
}
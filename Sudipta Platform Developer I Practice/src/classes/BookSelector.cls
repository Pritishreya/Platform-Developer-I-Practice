public with sharing class BookSelector {
    public String selectedBook{get;set;}
    public String errorMessage{get;set;}
    public Boolean hasAccess{get;set;}
    
    public BookSelector(){
        //Check if user is having access to the object
        if(!sudipta__Book__c.sObjectType.getDescribe().isAccessible()){
            errorMessage = 'SORRY!!! USER IS NOT HAVING ACCESS..';
            hasAccess=false;
        }else{
            hasAccess=true;
        }
    }
    
    public List<SelectOption> getAllBooks(){
        List<SelectOption> options = new List<SelectOption>();
        return options;
    }
}
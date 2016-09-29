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
        if(hasAccess){
            List<sudipta__Book__c> allBooks = [SELECT 
                                                    ID,
                                                    NAME,
                                                    sudipta__Author__c,
                                                    sudipta__Price__c,
                                                    sudipta__Type__c
                                               FROM sudipta__Book__c ];
            for(sudipta__Book__c singleBook : allBooks){
                options.add(new SelectOption(singleBook.Name, singleBook.Name));
            }
        }
        return options;
    }
}
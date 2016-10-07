public with sharing class DataTableExampleController_1 {
    public List<Contact> allContacts {
        get{
            if(allContacts == null){
                allContacts = [SELECT
                                    Account.Name,
                                    FirstName,
                                    LastName,
                                    Phone
                                FROM Contact
                                    LIMIT 10000 
                               ];
            }
            return allContacts;
        }
        set;
    }
}
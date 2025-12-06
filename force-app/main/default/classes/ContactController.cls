public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        // Simulate an error
        if (true) {
            throw new AuraHandledException('An error occurred while retrieving contacts.');
        }

        return [SELECT Id, FirstName, LastName, Email FROM Contact];
    }
}
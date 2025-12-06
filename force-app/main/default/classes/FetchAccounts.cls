public with sharing class FetchAccounts {
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [select name,phone from Account limit 10];
    }
}
public with sharing class AccountController {
    public static List<Account> getAccounts(){
        return [select id,name from Account limit 10];
    }
}
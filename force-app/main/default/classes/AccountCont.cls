public class AccountCont {
    public List<Account> accounts {get;set;}
    public AccountCont(){
        this.accounts = [select id,Name,Phone from Account limit 10];
    }
}
public class BatchFinal implements Database.Batchable<Sobject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        String s = 'select id from account';
        return Database.getQueryLocator(s);
    }
    public void execute(Database.BatchableContext bc,List<Account> lst){
        for(Account acc:lst){
            acc.name='nnn';
        }
        update lst;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Post logic');
    }
}
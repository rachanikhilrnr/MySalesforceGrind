public class QueueableExamp implements Queueable{
    List<Account> lst;
    public QueueableExamp(List<Account> lst){
        this.lst = lst;
    }
    public void execute(QueueableContext qc){
        for(Account acc:lst){
            acc.name='nikhil';
        }
        update lst;
    }
}
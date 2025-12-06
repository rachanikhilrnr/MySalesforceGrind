public class SchedulableExamp implements Schedulable{
    List<Account> lst;
    public SchedulableExamp(List<Account> lst){
        this.lst = lst;
    }
    public void execute(SchedulableContext sc){
        for(Account acc:lst){
            acc.name='nikhil';
        }
        update lst;
    }
}
@isTest
public class FinalTest {
    @istest(seeAllData=true)
    public static void meth(){
        List<Account> acc = [select id from Account];
        BatchFinal obj = new BatchFinal();
        Database.executeBatch(obj);
        QueueableExamp obj1 =new QueueableExamp(acc);
        System.enqueueJob(obj1);
        SchedulableExamp se = new SchedulableExamp(acc);
        String s = '0 30 14 ? * * *';
        System.schedule('the job',s,se);
    }
}
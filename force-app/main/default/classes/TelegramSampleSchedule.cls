public class TelegramSampleSchedule implements Schedulable{
    public void execute(SchedulableContext sc){
        Post__c post = [select id from Post__c where Telegram_Posted__c=false limit 1];
        if(post!=null) System.enqueueJob(new TelegramAPI(post.id));
    }
}
public class BlueskySampleSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        Post__c post = [select id from Post__c where Bluesky_Posted__c=false limit 1];
        System.enqueueJob(new Bluesky(post.id));
    }
}
public class MastodonSampleSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        Post__c post = [select id from Post__c where Mastodon_Posted__c=false limit 1];
        if(post!=null) System.enqueueJob(new MastodonAPI(post.id));
    }
}
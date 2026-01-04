public class PostSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        Post__c post = [select id,Tweet_Posted__c,Thread_Posted__c from Post__c where Tweet_Posted__c=false and Thread_Posted__c=false limit 1];
        if(post!=null){
            TwitterAPI.postTweet(post.id);
            ThreadsAPI.postThread(post.id);
        }
    }
}
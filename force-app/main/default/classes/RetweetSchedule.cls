public class RetweetSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        Retweet__c retweet = [select id,Retweet_Status__c from Retweet__c where Retweet_Status__c =false order by CreatedDate asc limit 1];
        if(retweet!=null) TwitterAPIParody.reTweet(retweet.id);
    }
}
public class TweetSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        Tweet__c tweet = [select id,Tweet_Text__c,Status__c from Tweet__c where Status__c ='Draft'  limit 1];
        if(tweet!=null) TwitterAPI.postTweet(tweet.id);
    }
}
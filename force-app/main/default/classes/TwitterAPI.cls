public class TwitterAPI {
    @future(callout=true)
    public static void postTweet(Id postid){
        Post__c post = [Select id,Text__c from Post__c where id=:postid];
        String Text = post.Text__c;

        // Quotes and apostrophes (most common culprits)
        Text = Text.replace('‘', '\'').replace('’', '\'').replace('“', '"').replace('”', '"');
        
        // Dashes (em/en dashes often auto-converted in word processors)
        Text = Text.replace('–', '-').replace('—', '-');  // en dash and em dash to hyphen
        
        String apikey = '1ulh5daJ1ZAwl6m8tKLgSecF5';
        String apikeysecret = '0MolHADlAnpTWpa9wLFsrOXHoBa3i63NTxfqdDmUTHVpBRAsLu';
        String accesstoken = '1904567792952901632-tRAWyWkQ01u8AdFEw3Po4uSG76oDwH';
        String accesstokensecret = 'r3Zh0OEv8jt8N7yNBiuxKZMdqSLrowjrhbc1H4ghygRYz';
        String apiurl = 'https://api.x.com';
        String userid = '1904567792952901632';
        //Communities
        List<String> communities = new List<String>{'1669995456934596610','1670065897837326336','1508713830645329920','1949327364858822928','1736307086017908862','1859645493006987401','1747886942153224536','1678303590035730433','1883632320739148172'};
        //Random number generation between 1 to 10
        Integer randomNumber = Integer.valueOf(Math.random() * 10);
        // Creating the request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(apiurl + '/2/tweets');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json; charset=utf-8');
        //Setting the community to the tweet
        if(randomNumber==9){
            req.setBody(JSON.serialize(new Map<String, String>{'text' => Text}));
        }else{
            req.setBody(JSON.serialize(new Map<String, Object>{'text' => Text,'community_id' => communities.get(randomNumber),'share_with_followers' => true}));
        }
        

        // Authenticating the user
        OAuth1Signer signer = new OAuth1Signer(apikey,apikeysecret,accesstoken,accesstokensecret);
        signer.signRequest(req);

        // Sending the request
        Http http = new Http();
        PostResult__c result = new PostResult__c();
        try{
            HttpResponse res = http.send(req);
            
            Map<String, Object> body = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            Map<String, Object> data = (Map<String,Object>) body.get('data');
            
            if (res.getStatusCode() == 200 || res.getStatusCode() == 201) {
                
                result.success__c = true;
                result.Messages__c = 'Posted successfully!';
                result.Platform_Id__c = (String) data.get('id');

                //Creating Retweet record;
                Retweet__c retweet = new Retweet__c();
                retweet.TweetId__c = (String)data.get('id');
                insert retweet;
            } else {
                result.success__c = false;
                result.Messages__c = 'Error ' + res.getStatusCode() + ': ' + res.getBody();
            }
        }catch(Exception e){
            result.success__c = false;
            result.Messages__c = 'Exception '+e.getMessage();
        }
        post.Tweet_Posted__c=true;
        update post;
        result.postid__c = postid;
		result.platform__c = 'Twitter';
        insert result;        
    }
}
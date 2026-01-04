public class TwitterAPIParody {
    @future(callout=true)
    public static void reTweet(Id retweetid){
        Retweet__c retweet = [select id,TweetId__c,Retweet_Status__c from Retweet__c where id=:retweetid];
        String apikey = 'oNO8ZJocnNIvaHsId5JSl30vD';
        String apikeysecret = 'KQuBHDTjmmEoTi8e1aFIVRep3PiKT8v307OqMUmgbODHNeT76q';
        String accesstoken = '1405436941961596929-ECNsaivTLXRMzJmNJm7yZGf8tLNzmJ';
        String accesstokensecret = 'BDvsiPbVdelonPbt5vhQNpd0jx4lebqqXBZQ29Ves5rqA';
        String apiurl = 'https://api.x.com';
        String userid = '1405436941961596929';
        
        // Creating the request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(apiurl + '/2/users/'+userid+'/retweets');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(new Map<String, String>{'tweet_id' => retweet.TweetId__c}));

        // Authenticating the user
        OAuth1Signer signer = new OAuth1Signer(apikey,apikeysecret,accesstoken,accesstokensecret);
        signer.signRequest(req);

        // Sending the request
        Http http = new Http();
        HttpResponse res = http.send(req); 
        Map<String, Object> body = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        Map<String, Object> data = (Map<String,Object>) body.get('data');
        System.debug(body);
        System.debug(data);
        retweet.Retweet_Status__c = true;
        update retweet;      

    }
}
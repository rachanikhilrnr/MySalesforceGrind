public class MastodonAPI implements Queueable,Database.AllowsCallouts {
    public static String clientkey = '-jTp8-tVIRxI7njRzlf0_BoOYRKLS_OZXaKKnHmxpCQ';
    public static String clientsecret = '05DWrje6vQx_6nrM-l_RA2o2w9ZizHuk_qJM1vcZuAQ';
    public static String accesstoken = 'N2zMzlHMIKd63cxPTBtaWZLfzSF-3zm05r_0IW-9tHc';
    public static String baseUrl = 'https://mastodon.social/';
    public String postid;
    public MastodonAPI(id postid){
        this.postid = postid;
    }
    public void execute(QueueableContext qc){
        Post__c post = [select id,text__c from Post__c where id=:postid];
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(baseUrl+'/api/v1/statuses');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json; charset=utf-8');
        req.setHeader('Authorization', 'Bearer ' + accesstoken);
        Map<String,Object> payload = new Map<String,Object>{
            'status' => post.text__c
        };
        req.setBody(JSON.serialize(payload));
        
        Http http = new Http();
        PostResult__c pr = new PostResult__c();
        try{
            HttpResponse res = http.send(req);
            Map<String,Object> response = (Map<String,Object>) JSON.deserializeUntyped(res.getBody());
            if(res.getStatuscode()==200 || res.getStatusCode()==201){
                System.debug('Successfully posted');
                pr.Messages__c = 'Posted Successfully';
                pr.Success__c = true;
            }else{
                System.debug('Failed posting');
                pr.Messages__c ='Failed';
            }
        }catch(Exception e){
            System.debug(e.getMessage());
            pr.Messages__c = 'Exception ' +e.getMessage();
        }
        pr.Platform__c ='Mastodon';
        pr.PostId__c = postid;
        insert pr;
        post.Mastodon_Posted__c  = true;
        update post;
    }
}
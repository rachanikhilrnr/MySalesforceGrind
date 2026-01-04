public class Bluesky implements Queueable, Database.AllowsCallouts {
    public static String pds ='https://bsky.social';
    public static String did = 'did:plc:ekgmfsomvdt4ap4uxmfrdud6';
    public static String handle = 'thepreserverofu.bsky.social';
    public static String app_password = 'qnbe-kx7f-pbmh-f76d';
    public static Secret__c keys = [select id,acessjwt__c,refreshjwt__c from Secret__c where id='a0NNS00002qyReI2AU'];
    public static String accessJwt = String.valueOf(keys.acessjwt__c);
    public static String refreshJwt = String.valueOf(keys.refreshjwt__c);
    public String postid;
    public Bluesky(String postid){
        this.postid = postid;
    }
    public void execute(QueueableContext qc){
        //Refresh token
        HttpRequest req = new HttpRequest();
        req.setEndpoint(pds+'/xrpc/com.atproto.server.refreshSession');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json; charset=utf-8');
        req.setHeader('Authorization', 'Bearer ' + refreshJwt);
        
        Http http = new Http();
        try{
            HttpResponse res = http.send(req);
            Map<String, Object> body = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            if(res.getStatusCode()==200 || res.getStatusCode()==201){
                Secret__c newS = [select id from Secret__c where id='a0NNS00002qyReI2AU'];
                newS.acessjwt__c = (string) body.get('accessJwt');
                newS.refreshjwt__c = (string) body.get('refreshJwt');
                update newS;
            }else{
                Secret__c newS = new Secret__c();
                newS.acessjwt__c = (string) String.valueOf(res.getStatusCode());
                insert newS;
            }
        }catch(Exception e){
            Secret__c newS = new Secret__c();
            newS.acessjwt__c = 'Exception' + (string) e.getMessage();
            insert newS;
        }
        System.enqueueJob(new BlueskySendpost(postid));
    }
}
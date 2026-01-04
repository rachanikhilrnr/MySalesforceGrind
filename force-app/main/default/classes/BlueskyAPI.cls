public class BlueskyAPI {
    public static String pds ='https://bsky.social';
    public static String did = 'did:plc:ekgmfsomvdt4ap4uxmfrdud6';
    public static String handle = 'thepreserverofu.bsky.social';
    public static String app_password = 'qnbe-kx7f-pbmh-f76d';
    public static Secret__c keys = [select id,acessjwt__c,refreshjwt__c from Secret__c where id='a0NNS00002qyReI2AU'];
    public static String accessJwt = String.valueOf(keys.acessjwt__c);
    public static String refreshJwt = String.valueOf(keys.refreshjwt__c);
	@future(callout=true)
    public static void postBs(Id postid){
		//Creating new post
        Post__c post = [select id,text__c from Post__c where id=:postid];
        HttpRequest req = new HttpRequest();
        req.setEndpoint(pds+'/xrpc/com.atproto.repo.createRecord');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json; charset=utf-8');
        req.setHeader('Authorization', 'Bearer ' + accessJwt);
        
        Map<String, Object> body = new Map<String, Object>();
    
        body.put('repo', handle); 
        body.put('collection', 'app.bsky.feed.post');
    
        // Nested record map
        Map<String, Object> record = new Map<String, Object>();
        record.put('$type', 'app.bsky.feed.post');
        record.put('text', post.Text__c);
        
        // createdAt in proper ISO format (GMT/Zulu time)
        DateTime now = DateTime.now();
        String createdAt = now.formatGmt('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
        record.put('createdAt', createdAt);
        
        // Attach the nested record to the main body
        body.put('record', record);
        req.setBody(JSON.serialize(body));
        
        Http http = new Http();
        PostResult__c result = new PostResult__c();
        try{
        	HttpResponse res = http.send(req);
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            System.debug(responseMap);
            if(res.getStatusCode()==200 || res.getStatusCode()==201){
                result.success__c = true;
                result.Messages__c = 'Posted successfully!';
                //result.Platform_Id__c = (String) data.get('id');
            }else{
                result.success__c = false;
                result.Messages__c = 'Failed! '+res.getStatusCode();
                //result.Platform_Id__c = (String) data.get('id');
            }
            
        }catch(Exception e){
            System.debug(e.getMessage());
            result.success__c = false;
            result.Messages__c = 'Exception: ' + e.getMessage();  
        }
        result.platform__c = 'Bluesky';
        insert result;
    }
	@future(callout=true)    
    public static void refreshTokens(){
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
    }
}
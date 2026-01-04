public class ThreadsAPI {

    private static String baseUrl = 'https://graph.threads.net/v1.0/';
	private static String accesstoken = 'THAARzlkI2HSxBUVRqalBOSjdNcHRKbkVVSUVoOEljRXYwWGN0TzRvOVROTEdUcURtMHZAVVGFEcHFPY3ZA4N2R5X0dWZAnBkS2RkVWVhRlVrU2FZAbzZAROXE3MDgxWkxwNXpNRWp4U000RkhVanJ6c2t3ZAkFVbTNSaWplZA1NTRTJENlZAQUQZDZD';
    private static String threads_id = '24618885437785684';
    @future(callout=true)
    public static void postThread(id postid) {
        
       	Post__c post = [select id,Text__C,Thread_Posted__c from Post__c where id=:postid];
		String Text = post.Text__c;
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint(baseUrl +'/'+ threads_id +'/threads');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json; charset=utf-8');
        req.setHeader('Authorization', 'Bearer ' + accesstoken);
        
        Map<String, Object> payload = new Map<String, Object>{
            'media_type' => 'TEXT',
            'text' => Text,
            'auto_publish_text' => true
        };
        req.setBody(JSON.serialize(payload));

        PostResult__c result = new PostResult__c();
        
        try {
            HttpResponse res = http.send(req);
            Map<String, Object> body = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        	Map<String, Object> data = (Map<String,Object>) body.get('data');
            if (res.getStatusCode() == 200 || res.getStatusCode() == 201) {
                Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                result.success__c = true;
                result.Messages__c = 'Posted successfully!';
                result.Platform_Id__c = (String) data.get('id');
                
            } else {
                result.success__c = false;
                result.Messages__c = 'Error ' + res.getStatusCode() + ': ' + res.getBody();
            }
        } catch (Exception e) {
            if(e.getMessage()=='Read timed out' || e.getMessage()=='Attempt to de-reference a null object'){
                result.success__c = true;
                result.Messages__c = 'Posted successfully! but no Id because of an exception!';
            }else{
                result.success__c = false;
                result.Messages__c = 'Exception: ' + e.getMessage();    
            }
        }
        post.Thread_Posted__c = true;
		result.postid__c = postid;
		result.platform__c = 'Threads';
        insert result;
        update post;
    }

}
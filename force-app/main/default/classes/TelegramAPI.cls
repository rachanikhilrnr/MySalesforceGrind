public class TelegramAPI implements Queueable,Database.AllowsCallouts{
    public String postid;
    public static String accesstoken = '8541039482:AAF_TDelZw66e2sxUJRBBfIGJjbbzCfuQWY';
    public static String baseurl = 'https://api.telegram.org';
    public static String chatid = '@thepreserverofu';
    public TelegramAPI(id postid){
        this.postid=postid;
    }
    public void execute(QueueableContext qc){
        Post__c post = [select id,text__c from Post__c where id=:postid];
        
        //HttpRequest
        HttpRequest req = new HttpRequest();
        req.setEndpoint(baseurl+'/bot'+accesstoken+'/sendMessage');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json; charset=utf-8');
        Map<String,Object> payload = new Map<String,Object>{
            'chat_id' => chatid,
             'text' => post.text__c
        };
        req.setBody(JSON.Serialize(payload));
        
        //HttpResponse
        Http http = new Http();
        PostResult__c pr = new PostResult__c();
        try{
            HttpResponse res = http.send(req);
            if(res.getStatusCode()==200 || res.getStatusCode()==201){
                Map<String,Object> response = (Map<String,Object>) JSON.deserializeUntyped(res.getBody());
                pr.Messages__c = 'Successfully Posted';
                pr.Success__c = true;
                System.debug('Success');
            }else{
                System.debug('Failed');
                pr.Messages__c = 'Failed';
            }
        }catch(Exception e){
            System.debug(e.getMessage());
            pr.Messages__c = 'Exception '+e.getMessage();
        }
        pr.PostId__c = postid;
        pr.Platform__c = 'Telegram';
        insert pr;
        post.Telegram_Posted__c = true;
        update post;
    }
}
trigger TextFormattingonPost on Post__c (before insert) {
    List<Post__c> posts = trigger.new;
    for(Post__c post:posts){
        String text = TextFormatting.cleanText(post.Text__c);
        post.Text__c = text;
    }
}
public class OAuth1Signer {
    
    private String consumerKey;
    private String consumerSecret;
    private String accessToken;
    private String tokenSecret;
    
    public OAuth1Signer(String cKey, String cSecret, String aToken, String tSecret) {
        consumerKey = cKey;
        consumerSecret = cSecret;
        accessToken = aToken;
        tokenSecret = tSecret;
    }
    
    public void signRequest(HttpRequest req) {
        String method = req.getMethod();
        String url = req.getEndpoint();
        // Parse query params if any (we don't have for POST JSON)
        Map<String, String> params = new Map<String, String>();
        
        // Add OAuth params
        String nonce = String.valueOf(Crypto.getRandomLong()).replace('-', '0');
        String timestamp = String.valueOf(DateTime.now().getTime() / 1000);
        
        params.put('oauth_consumer_key', EncodingUtil.urlEncode(consumerKey, 'UTF-8'));
        params.put('oauth_nonce', EncodingUtil.urlEncode(nonce, 'UTF-8'));
        params.put('oauth_signature_method', 'HMAC-SHA1');
        params.put('oauth_timestamp', timestamp);
        params.put('oauth_token', EncodingUtil.urlEncode(accessToken, 'UTF-8'));
        params.put('oauth_version', '1.0');
        
        // Build base string
        String baseString = method.toUpperCase() + '&' + 
            EncodingUtil.urlEncode(url.split('\\?')[0], 'UTF-8') + '&' +
            EncodingUtil.urlEncode(normalizeParams(params), 'UTF-8');
        
        // Signing key
        String key = EncodingUtil.urlEncode(consumerSecret, 'UTF-8') + '&' + EncodingUtil.urlEncode(tokenSecret, 'UTF-8');
        
        // Generate signature
        Blob sigBlob = Crypto.generateMac('HmacSHA1', Blob.valueOf(baseString), Blob.valueOf(key));
        String signature = EncodingUtil.base64Encode(sigBlob);
        params.put('oauth_signature', EncodingUtil.urlEncode(signature, 'UTF-8'));
        
        // Build Authorization header
        String header = 'OAuth ';
        for (String k : new List<String>{'oauth_consumer_key', 'oauth_nonce', 'oauth_signature', 
                                         'oauth_signature_method', 'oauth_timestamp', 'oauth_token', 'oauth_version'}) {
            header += k + '="' + params.get(k) + '", ';
        }
        header = header.removeEnd(', ');
        
        req.setHeader('Authorization', header);
    }
    
    private String normalizeParams(Map<String, String> params) {
        List<String> keys = new List<String>(params.keySet());
        keys.sort();
        String normalized = '';
        for (String k : keys) {
            normalized += k + '=' + params.get(k) + '&';
        }
        return normalized.removeEnd('&');
    }
}
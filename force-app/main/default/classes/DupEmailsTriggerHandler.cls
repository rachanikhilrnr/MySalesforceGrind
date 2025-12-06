public class DupEmailsTriggerHandler {
    public static void restrict(List<Contact> cons){
        Set<Id> accset = new Set<Id>();
        for(Contact c:cons){
            if(c.accountId != null && c.email != null){
                accset.add(c.accountId);
            }
        }
        List<Contact> existingCon = [select id,accountId,email from Contact where accountId in :accset and email<>null];
        Map<Id,Set<String>> accmapset = new Map<Id,Set<String>>();
        for(Contact con:existingCon){
            if(!accmapset.containsKey(con.accountId)){
                accmapset.put(con.accountId,new Set<String>());
			}
            accmapset.get(con.accountId).add(con.email);
		}
        for(Contact con:cons){
            if(con.accountId != null && con.email !=null){
                if(accmapset.containsKey(con.accountId) && accmapset.get(con.accountId).contains(con.email)){
                    con.addError('Duplicates cannot be allowed');
                }
            }
		}
    }
}
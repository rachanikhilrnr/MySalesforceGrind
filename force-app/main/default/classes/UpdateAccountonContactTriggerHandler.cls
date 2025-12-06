public class UpdateAccountonContactTriggerHandler {
    public static void afterupdate(Map<Id,Contact> oldcons, Map<Id,Contact> newcons){
        //Set<Id> accids = new Set<Id>();
        Map<Id,Id> ids = new Map<Id,Id>();
        for(Id idno:oldcons.keySet()){
            if(oldcons.get(idno).phone!=newcons.get(idno).phone){
                ids.put(oldcons.get(idno).accountId,idno);
            }
        }
        List<Account> accs = [select id,phone from Account where id in :ids.keySet()];
        for(Account acc:accs){
            acc.phone=newcons.get(ids.get(acc.id)).phone;
		}
		update accs;        
    }
}
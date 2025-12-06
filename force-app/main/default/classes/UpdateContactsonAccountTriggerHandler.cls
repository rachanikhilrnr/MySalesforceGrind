public class UpdateContactsonAccountTriggerHandler {
    public static void afterupdate(Map<Id,Account> oldAccs,Map<Id,Account> newAccs){
        Set<Id> accids = new Set<Id>();
    	for(Id idno:oldAccs.keySet()){
        	if(oldAccs.get(idno).phone!=newAccs.get(idno).phone){
                accids.add(idno);
        	}
		}
        List<Contact> cons = [select id,accountId from Contact where accountID in :accids];
        for(Contact con:cons){
            con.phone=newAccs.get(con.accountId).phone;
        }
        update cons;
	}
}
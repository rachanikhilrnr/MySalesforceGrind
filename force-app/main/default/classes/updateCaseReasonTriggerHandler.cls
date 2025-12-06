public class updateCaseReasonTriggerHandler {
    public static void afterUpdate(Map<Id,Case> oldmap,Map<Id,Case> newmap){
        Set<id> caseids = new Set<id>();
        for(Case c:oldmap.values()){
            if(oldmap.get(c.id).type!=newmap.get(c.id).type){
                if(newmap.get(c.id).type!='Electrical'){
                    caseids.add(c.id);
                }
            }
		}
        List<Case> mycases = [select id,type from Case where id in :caseids];
        for(Case c:mycases){
            c.type='Electrical';
        }
        update mycases;
	}
}
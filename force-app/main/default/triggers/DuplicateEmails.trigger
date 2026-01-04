trigger DuplicateEmails on Contact (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
        DupEmailsTriggerHandler.restrict(trigger.new);
    }
}
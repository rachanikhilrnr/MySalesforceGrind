public class Sample {
    public static void method(){
        List<Account> lst = [select id,(select id from contacts) from account];
        Map<Account,Integer> mapp = new Map<Account,Integer>();
        for(Account acc:lst){
            mapp.put(acc,acc.contacts.size());
        }
        for(Account acc:mapp.keySet()){
            System.debug(acc+' '+mapp.get(acc));
        }
        for(Integer i:mapp.values()){
            System.debug(i);
        }
    }
}
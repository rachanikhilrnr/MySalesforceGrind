public class Interview {
    public static void method(){
        List<Account> lst = [select id,name from Account];
        for(Account acc:lst){
            System.debug(acc.name);
        }
        Map<Id,Account> accMap = new Map<Id,Account>([select id,name from Account]);
        for(Id idno:accMap.keySet()){
            System.debug(accMap.get(idno).name);
        }
        Map<String,Integer> mapp = new Map<String,Integer>{ 'Nikhil' => 90, 'Hello' =>40};
        System.debug(mapp.get('Nikhil'));
    }
}
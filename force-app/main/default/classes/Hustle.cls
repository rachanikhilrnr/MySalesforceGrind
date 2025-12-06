public class Hustle {
    public static void method(){
        Account[] accset = [select id,name from Account where name<>'nikhil'];
        for(Account acc:accset){
            Contact[] con = [select id from Contact];
            for(Contact c:con){
                System.debug(c.id);
            }
        }
    }
}
public class MyClass {
    public static void method(){
        System.debug('Hello World');
        List<Account> acc = [select id from Account];
        for(Account a:acc){
            System.debug(a.name);
        }
    }
}
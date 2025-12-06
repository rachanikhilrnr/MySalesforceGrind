public class Revenue {
    public static void method(){
        List<Account> lst = [select AnnualRevenue from Account];
        decimal sum = 0;
        for(Account acc:lst){
            if(acc.AnnualRevenue != null){
                sum += acc.AnnualRevenue;
            }
        }
        System.debug(sum);
    }
}
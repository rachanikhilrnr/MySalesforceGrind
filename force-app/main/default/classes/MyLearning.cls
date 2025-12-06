public class MyLearning {
    public static void method(){
        List<AggregateResult> arr = [select accountId,count(id) cnt from Contact group by accountId];
        for(AggregateResult ar:arr){
            System.debug((id)ar.get('accountId'));
            System.debug((integer)ar.get('cnt'));
        }
    }
}
public class CtsClass {
    public static void mymethod(){
        System.debug('HelloWorld');
        Set<Integer> myset = new Set<Integer>();
        List<Integer> lst = new List<Integer>();
        Map<Integer,Integer> mymap = new Map<Integer,Integer>();
        mymap.put(1,234);
        mymap.put(2,472);
        mymap.put(3,370);
        for(Integer val:mymap.keySet()){
            System.debug(mymap.get(val));
        }
    }
}
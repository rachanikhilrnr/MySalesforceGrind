public class MyFirstClass {
    public static void createset(){
        Set<Integer> sett = new Set<Integer>();
        sett.add(1);
        sett.add(2);
        sett.add(3);
        sett.add(4);
        sett.add(5);
        if(sett.contains(3)){
            System.debug('It contains 3');
        }
        for(Integer i:sett){
            System.debug(i);
        }
    }
    public static void fruits(){
        Map<String,Integer> mapp = new Map<String,Integer>();
        mapp.put('Mangoes',4);
        mapp.put('Apples',3);
        mapp.put('Grapes',9);
        System.debug(mapp.get('Apples'));
        for(String s:mapp.keySet()){
            System.debug('The key is '+s+' and value is '+mapp.get(s));
        }
    }
    public static void updatee(){
        List<Integer> lst = new List<Integer>();
        lst.add(10);
        lst.add(20);
        lst.add(30);
        lst.add(40);
        lst.add(50);
        lst.set(2,35);
        lst.remove(3);
        System.debug(lst);
    }
    public static void colors(){
        Set<String> lst = new Set<String>();
        lst.add('Red');
        lst.add('Green');
        lst.add('Blue');
        lst.add('Yellow');
        lst.remove('Green');
        boolean b = lst.contains('Yellow');
        System.debug(b);
        
    }
}
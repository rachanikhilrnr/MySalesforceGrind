public class Employee {
    static string name = 'Nikhil';
    static string department = 'Salesforce' ;
    static integer age = 21;
    public static void display(){
        System.debug(name+' is working in the department of '+department+' and his age is'+age);
    }
}
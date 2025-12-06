@isTest
public class DupEmailsTriggerHandlerTest {
    @isTest
    public static void restrictTestClass(){
        Account acc = new Account(name='Hello');
        insert acc;
        Contact c1 = new Contact(lastname='Hi',email='rachanikhil2003@gmail.com',accountId=acc.id);
        insert c1;
        Contact c2 = new Contact(lastname='Bye',email='rachanikhil2003@gmail.com',accountId=acc.id);
        insert c2;
    }
}
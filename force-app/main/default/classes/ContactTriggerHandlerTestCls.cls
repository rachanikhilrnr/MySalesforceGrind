@isTest
public class ContactTriggerHandlerTestCls {
	@isTest
    public static void afterInsert(){
        Account acc = new Account();
        acc.name='cognizant';
        acc.phone='678977';
        insert acc;
        Contact con1 = new Contact();
        con1.lastname = 'nikhil';
        con1.Phone = '09873';
        con1.AccountId=acc.id;
        Contact con2 = new Contact();
        con2.lastname = 'sumana';
        con2.Phone = '72397';
        con2.AccountId=acc.id;
        insert con1;
        insert con2;
        con1.phone='12345';
        update con1;
    }
}
@isTest
public class AccountTriggerHandlerTestCls {
	@isTest
    public static void afterinsert(){
        Account acc = new Account();
        acc.name='aldsf';
        acc.phone='43702';
        insert acc;
        Contact con = new Contact();
        con.lastname='lskadjf';
        con.phone='72983';
        con.AccountId = acc.id;
        insert con;
        acc.phone='3423';
        update acc;
        
    }
}
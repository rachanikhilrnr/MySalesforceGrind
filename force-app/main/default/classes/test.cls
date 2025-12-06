@IsTest
public class test {
    @IsTest
    public static void meth(){
        Account a = new Account(name='abcd');
        Contact c1 = new Contact(lastname='nikhil',accountId=a.id);
        insert c1;
        Contact c2 = new Contact(lastname='nikhitha',accountId=a.id);
        insert c2;
    }
}
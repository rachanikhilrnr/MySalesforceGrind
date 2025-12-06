public class DiscountUtility {
    public static decimal applyDiscount(decimal originalprice, decimal discountpercent){
        decimal discountamount = originalprice*(discountpercent/100);
        decimal actualprice = originalprice - discountamount;
        return actualprice;
    }
    public static decimal pricetax(decimal discountamount){
        return discountamount-3.00;
    }
}
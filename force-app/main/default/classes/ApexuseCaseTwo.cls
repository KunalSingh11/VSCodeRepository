public class ApexuseCaseTwo {
    public static decimal calculateInterest(decimal principal, decimal rate, decimal t) {
        if(principal!=null && rate!=null && t!=null){
            decimal si = (principal*rate*t)/100;
            return si;
        }
        return 0;
    }
}
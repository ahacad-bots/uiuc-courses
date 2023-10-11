
public class L04_ACM {

	public static void main(String[] args) {
		double owed = 1000;
		int month = 0;
		double rate = .2;
		double rate_increase = .05;
		double threshold = 12000;
		
		while (owed <= threshold) {
			month = month + 1;
			owed = owed + owed * rate;  // or owed * (1 + rate)
			rate = rate + rate_increase;
		}
		
		System.out.println(month);
	}

}

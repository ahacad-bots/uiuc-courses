public class L06_TrueLoveTypes {

	public static void main(String[] args) {
		boolean love = false;
		int petal = 0;
		while (Math.random() <= (1. - 0.01 * petal) ) {
			// flip love between true<>false 
			love = ! love; // assign to love the value of 'not' love 
			petal ++;
			if (love) {
				System.out.println("Loves me");
			} else {
				System.out.println("Loves me not");
			}
		}
		System.out.println(petal + " petals picked");
	}

}

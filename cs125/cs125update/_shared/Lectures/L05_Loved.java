
public class L05_Loved {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int petals = 10;
		boolean loved = true;
		
		while (petals > 0) {
			petals = petals - 1;  // aka petals --;

			if (loved) {
				System.out.println("She/He/It loves me!");
				//loved = false;
			} else {
				System.out.println("She/He/It loves me not!");
				//loved = true;
			}
			loved = !loved;
		}

	}

}

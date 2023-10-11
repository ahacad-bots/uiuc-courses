public class L12_CopyStringArray {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// Creates an array object AND
		// a variable 'friends' that points to the array object.

		String[] frenemies = new String[] { "Alice", "Bill" };
		// make a new pointer and make it point to the existing array
		String[] oldZombie = new String[frenemies.length + 1];
		for (int i = 0 ; i < frenemies.length ; i ++) {
			oldZombie[i] = frenemies[i];
		}
		oldZombie[frenemies.length] = "Craig is awesome";
		frenemies = oldZombie;
		
		// alternatively code to insert into the middle
//		int pos = frenemies.length / 2;
//		oldZombie[pos] = "Craig is awesome";
//
//		for (int i = 0 ; i < pos ; i ++) {
//			oldZombie[i] = frenemies[i];
//		}
//		for (int i = pos ; i < frenemies.length ; i ++) {
//			oldZombie[i+1] = frenemies[i];
//		}
		
		// deep copy of integers
		int [] x = new int [] {3, 5, 7};
		int [] y = new int [x.length];
		for (int i = 0 ; i < x.length ; i ++) {
			y[i] = x[i];
		}

	}

}

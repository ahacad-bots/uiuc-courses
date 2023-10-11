public class L14_UnsortedFilter {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int[] a = {7,5,2};
		int[] b = {9,3,8,2,0,5};
		// Print all numbers that are in b that are not in a.
		// Note, a and b are unsorted (not in any particular order).

		boolean match = false;
		for(int bi = 0; bi < b.length; bi++) {
			match = false;
			for(int ai = 0; ai < a.length; ai++) {
				if( a[ai] == b[bi])
					match = true;
			}
			if( ! match )
				TextIO.put(b[bi]+" ");
		}		
	}
}

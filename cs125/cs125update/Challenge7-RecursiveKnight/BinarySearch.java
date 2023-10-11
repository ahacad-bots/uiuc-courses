//UIUC CS125 FALL 2013 MP. File: BinarySearch.java, CS125 Project: Challenge7-RecursiveKnight, Version: 2013-11-12T10:44:04-0600.496641397
/**
	 * @author pliu15
	 */
public class BinarySearch {
	/** Wrapper method. Just runs the recursive search method below for the entire array*/
	public static boolean search(int[] array, int key) {
		return search(array, key, 0, array.length - 1);
	}

	/**
	 * Recursive search using Divide and Conquer approach:
	 * The given array is already sorted so we can very quickly discover if the key is in the array or not.
	 * Hint: For the recursive case check the value at (lo+hi)/2
	 * and proceed accordingly.
	 */
	static boolean search(int[] array, int key, int lo, int hi) {
		int i;
		boolean t = false;
		i = (lo + hi)/2;
		if (array[i] == key) 
			t = true;
	    if (lo == hi) 
	    	return t;
		if (array[i] > key) 
			t = search(array, key, lo, i);
		if (array[i] < key) 
			t = search(array, key, i + 1, hi);
		return t;//return false;
	}
}

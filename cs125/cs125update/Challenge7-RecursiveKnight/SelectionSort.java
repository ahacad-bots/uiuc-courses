//UIUC CS125 FALL 2013 MP. File: SelectionSort.java, CS125 Project: Challenge7-RecursiveKnight, Version: 2013-11-12T10:44:04-0600.496641397
/**
	 * @author pliu15
	 */
public class SelectionSort {
	/**
	 * Sorts the entire array using selection sort
	 * This is just a wrapper method that calls the 
	 * recursive method with the correct parameter lo,hi values.
	 * @param data
	 */
	public static void sort(double[] data) {
		int l = data.length;
		sort(data, 0, l - 1);
	}

	/** Recursively sorts the sub array lo...hi using selection sort algorithm.*/
	public static void sort(double[] data, int lo, int hi) {
		if (lo == hi) return;
		int i = findMin(data, lo, hi);
		swap(data, i, lo);
		sort(data, lo + 1, hi);
	}

	/** Helper method for selection sort: Swaps values at indices i and j*/
	public static void swap(double[] data, int i, int j) {
		double tmp = data[i];
		data[i] = data[j];
		data[j] = tmp;
	}

	/**
	 * Recursively finds the position of the smallest value of the values lo...hi (inclusive). 
	 * @param data
	 * @param lo
	 * @param hi
	 * @return
	 */
	public static int findMin(double[] data, int lo, int hi) {
		if (lo == hi) return lo;
		int i = findMin(data, lo + 1, hi);
		if (data[lo] < data[i]) 
			return lo; 
		return i;//return 0;
	}

}

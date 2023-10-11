//UIUC CS125 FALL 2013 MP. File: MolecularSort.java, CS125 Project: Challenge7-RecursiveKnight, Version: 2013-11-12T10:44:04-0600.496641397
/**
	 * @author pliu15
	 */
public class MolecularSort {

	/** Sorts each xyz coordinate using it's Z value (coord[i][2] <= coord[j][2] for i<j). */
	static void sortCoordsByZ(double[][] coords) {
		double [][] sorts = new double[coords.length][coords[0].length];
		for (int i = 0; i < coords.length/2; i ++){
			sorts[0] = coords[i];
			coords[i] = coords[coords.length-i-1];
			coords[coords.length-i-1] = sorts[0];
		}
// TODO: Implement this wrapper method.
		//All the work is performed by recursiveSort
	}

	/**
	 * recursively sorts coordinates entries by their z value. Entries between
	 * lo and hi inclusive are considered.
	 */
	static void recursiveSort(double[][] coords, int lo, int hi) {
		double[][] tmp = new double[coords.length][coords[0].length];
		tmp[lo] = coords[hi];
		for (int i = lo; i < hi; i ++)
			tmp[i+1] = coords[i];
		for (int j = lo; j <= hi; j ++)
			coords[j] = tmp[j];// TODO: write the four lines of a recursive selection sort here.
	}

	/**
	 * returns the index of the entry with the lowest Z value. Entries between
	 * lo and hi inclusive are considered.
	 */
	static int findIndexOfZMinimum(double[][] coords, int lo, int hi) {
		double min = coords[lo][0];
		for (int i = lo; i < hi + 1; i ++)
			for (int j = 0; j < coords[0].length; j ++)
				if (coords[i][j] < min) {
					min = coords[i][j];
					lo = i;
				} 
		return lo; // TODO: Replace this with your three lines of recursive code
	}
	

	/* Swaps the (x,y and z) values of the i-th and j-th coordinates.*/
	static void swap(double[][] coords, int i, int j) {
		double[][] tmp = new double[coords.length][coords[0].length];
		tmp[0] = coords[j];
		coords[j] = coords[i];
		coords[i] = tmp[0];// TODO: write your swap implementation here
	}
}

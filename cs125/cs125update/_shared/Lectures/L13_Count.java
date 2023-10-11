public class L13_Count {

	public static boolean positive(double[] data) {
		int count = 0;
		for (int i = 0; i < data.length; i++) {
			if (data[i] > 0)
				count++;
		}
		return count >= (data.length / 2 + 1);
		// Now go back and check for even and odd arrays
		// e.g Array of length 3. Need at least 2
	}

	// Returns true if there are at least 6 examples
	// where the next array cell is twice the value as the previous one.
	// e.g. count ({1, 2, 4, 8 , 9, 3, 6, 0, 0, -1, -2 }) will return true.

	public static boolean count(int[] data) {
		int result = 0;

		for (int i = 0; i < data.length - 1; i = i + 1) {

			if (data[i] * 2 >= data[i + 1])
				result = result + 1;
		}
		return result >= 6;
		// Now go back and check... >= > < <=

	}

}

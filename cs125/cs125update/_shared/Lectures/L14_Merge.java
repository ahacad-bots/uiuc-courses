public class L14_Merge {

	public static int[] merge(int[] A, int[] B) {
		// Assumes the values in A and B are already sorted.
		// returns a new array with all of the values from A and B 
		// in sorted order
		int done = 0;
		int countA = 0;
		int countB = 0;

		int[] result = new int[A.length + B.length];

		// while there are cards left in both piles
		while ((countA < A.length) && (countB < B.length)) {
			// select the smallest card from A or B
			// copy its value into the result array
			
			if ( A[countA]<B[countB])
				result[done++] = A[countA++];
			else
				result[   done++    ] = B[   countB++   ];
		}
		// One of the piles must be exhausted
		// so copy the remaining cards into the result
		// Only one of these two remaining while loops will run
		while (countA < A.length)
			result[done++] = A[countA++];
		while (countB < B.length)
			result[done++] = B[countB++];
		
		return result;
	}
}

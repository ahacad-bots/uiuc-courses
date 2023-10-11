public class L15_MakeChecker {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		char[][] t = makeChecker(3);
		for(int i =0;i<3;i++)
			for(int j =0;j<3;j++) {
				//System.out.println("i="+i+",j="+j+"="+t[i][j]);
			}
	}

	public static char[][] makeChecker(int h) {
		char[][] result = new char[h][h];
		int i = 0, j = 0;
		for (; i < h; i++) {
			// be sure to reset j back to zero
			for (j=0; j < h; j++) {
				System.out.println("i="+i+", j="+j);
				if ( (i+j) % 2 == 0)
					result[i][j] = 'E';
				else
					result[i][j] = 'O';
			}
		} // for i
		System.out.println("Returning");
		return result;
	}

}

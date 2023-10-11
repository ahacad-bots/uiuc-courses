public class L10_hack {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// double x = -1.59;
		// int i = (int) x;
		//
		// if ((int)x == -1) {
		// TextIO.putln("These are equal!!!");
		// }
		//
		// TextIO.putln(i);

		int x = 53;
		int y = 100;
		if (x % 2 == 0)
			if (x > 50)
				y = 101;
			else
				y = 102;
		TextIO.putln("y=" + y);
		
		if (23.00002 == 23)
			TextIO.putln("equal");

	}

}

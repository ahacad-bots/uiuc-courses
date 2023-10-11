public class L09_substring {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// String s = "ABC";
		// String s1 = s.substring(0,5);
		// TextIO.putln(s1);

		// int dice = (int)Math.random() * 6;
		// TextIO.putln(dice);

		int die1 = 0, die2 = 0;
		int count = 1;
		boolean foundSolution = false;
		while (!foundSolution) {
			die1 = 1 + (int) (Math.random() * 6);
			die2 = 1 + (int) (Math.random() * 6);
			foundSolution = die1 + die2 == 2;
			count++;
		}
		TextIO.putln("That took " + count + " rolls");
		TextIO.putln(die1 + 10 * die2);
		// return die1 + 10 * die2;

//		String s = "BLAH";
//		boolean x = s.toLowerCase().toUpperCase().toLowerCase().toUpperCase()
//				.equals(s);

	}

}

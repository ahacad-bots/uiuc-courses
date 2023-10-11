public class L10_HomerDice {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int result = L10_HomerDice.rollThreeUniqueDice();
		TextIO.putln(result);

	}

	/**
	 * Rolls two simulated 6 sided dice until both die values are equal to one.
	 * Prints out the number of times the dice were rolled.
	 * 
	 * @return the dice roll encoded as an integer value.
	 */
	public static int rollSnakeEyes() {
		int die1 = 0, die2 = 0;
		int count = 0;
		boolean foundSolution = false;
		while (!foundSolution) {
			die1 = 1 + (int) (Math.random() * 6);
			die2 = 1 + (int) (Math.random() * 6);
			foundSolution = die1 + die2 == 8;
			count++;
		}
		TextIO.putln("That took " + count + " rolls");
		return die1 + 10 * die2;
	}

	/**
	 * Rolls three simulated 6 sided dice until all die values are unique.
	 * Return the number of iterations required.
	 */
	public static int rollThreeUniqueDice() {
		int die1 = 0, die2 = 0, die3 = 0;
		int count = 0;
		
		boolean foundSolution = false;
		while (!foundSolution) {
			die1 = 1 + (int) (Math.random() * 6);
			die2 = 1 + (int) (Math.random() * 6);
			die3 = 1 + (int) (Math.random() * 6);
			foundSolution = (die1 != die2) && (die1 != die3) && (die2 != die3);
			// ((die1 - die2)*(die2 - die3)*(die1 - die3)) != 0
			count ++;
		}
		return count;
	}

}

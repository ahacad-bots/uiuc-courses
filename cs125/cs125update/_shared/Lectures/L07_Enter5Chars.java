public class L07_Enter5Chars {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// I'm going to need TextIO.getln() and TextIO.putln()

		boolean done = false;
		String input;

		// while the user hasn't given valid input
		while (!done) {
			TextIO.putln("Enter a string with exactly 5 characters.");
			// get the user's input
			input = TextIO.getln();
			TextIO.putln("You typed: " + input); // + user's input

			// does user's input have 5 characters?
			if (input.length() == 5) {
				TextIO.putln("Yes!");
				// exit loop
				done = true;
			} else {
				// if not
				TextIO.putln("Try again!");
				// repeat loop
			}
		}
	}

}

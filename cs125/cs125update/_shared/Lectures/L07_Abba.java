public class L07_Abba {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TextIO.putln("Please enter a string where the first and last letters are the same.");
		String input = "";
		
		input = TextIO.getln();
		
		// Do not enter an empty string.
		// I can fix this for $$$
		
		// print out original string
		TextIO.putln("You typed \""  + input  + "\"");
		
		// get back a new string object and change 'input' to point to it-
		input =input.toUpperCase();

		char first = input.charAt(0);
		char last  = input.charAt(  input.length() - 1   );
		
		if (first == last) {
			TextIO.putln("You win!");
		}
	}

}

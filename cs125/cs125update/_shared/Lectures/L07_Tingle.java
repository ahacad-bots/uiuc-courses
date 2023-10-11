
public class L07_Tingle {

	public static void main(String[] args) {
		String input = "";
		TextIO.putln("Enter a word that includes the substring 'ting'");
		input = TextIO.getln();
		
		TextIO.putln("You entered: '" + input + "'");
		
		int position = input.indexOf("ting");
		
		// Parenthesis around position + 1 is required!
		TextIO.putln("Found ‘ting’ at position "+ (position +1));
	}

}

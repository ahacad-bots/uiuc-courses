public class L11_TwoLetters {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		for (int i = 0; i < 26; i++)
			for (int j = 0; j < 26; j++) {

				TextIO.put((char) (i + 'a'));
				TextIO.putln((char) (j + 'a'));
			}

		// Print a triangle of stars
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < i; j++) {
				TextIO.put("*");
			}
			TextIO.putln();
		}
	}
}

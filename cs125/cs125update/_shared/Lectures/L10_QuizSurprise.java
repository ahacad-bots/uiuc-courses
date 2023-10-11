public class L10_QuizSurprise {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int result = (int) ( L10_QuizSurprise.random() * 2);
		if (result == 0) {
			TextIO.putln("No Quiz!");
		} else {
			TextIO.putln("Surprise Quiz Today!");
		}
	}

	private static double random() {
		return 0.1;  // not really random?
	}

}

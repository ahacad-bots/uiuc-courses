public class L08_Password {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		boolean done = false;

		while (!done) {
			TextIO.putln("New password? (10 or more characters, mixed case, no spaces)");

			String password = TextIO.getln();

			boolean tooShort = password.length() < 10; // true if too short

			// String lowerCaseVersion = password.toLowerCase();
			// boolean noUpperCase = password.equals(lowerCaseVersion);
			boolean noUpperCase = password.equals(password.toLowerCase());
			boolean noLowerCase = password.equals(password.toUpperCase());

			boolean hasSpaces = password.contains(" "); // indexOf(" ") != -1;
			// boolean hasSpaces = !password.equals(password.trim()); don't do
			// this.

			boolean badPass = tooShort || noUpperCase || noLowerCase
					|| hasSpaces;

			if (badPass) {
				TextIO.putln("Bad password Ð try again.");
			} else {
				TextIO.putln("Password accepted, thanks.");
				done = true;
			}
		}

	}
}

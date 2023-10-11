public class L14_LoveLetter {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		String[][] letter = {
				{ "Hi", "Dear", "Dearest" },
				{ "Chris,", "Jenny,", "sugar,", "sweetheart," },
				{ "\n" },
				{ "I can no longer", "I want to", "I need to", "I long to" },
				{ "think", "swim", "break up", "sing country music", "talk",
						"study" },
				{ "for you.", "with you.", "about you.", "near to you",
						"far from you" }, 
				{ "\n" },
				{ "Bye,", "Your loving friend," }, 
				{ "\n" },
				{ "Anon", "Lisa", "Nicole" } };
		for (int i = 0; i < letter.length; i++) {
			String[] options = letter[i];
			TextIO.put(options[(int) (Math.random() * options.length)] + " ");
		}

	}

}

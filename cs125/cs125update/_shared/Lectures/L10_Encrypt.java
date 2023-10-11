public class L10_Encrypt {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		encrypt();
	}

	/**
	 * Prints encrypted string. a->b, b->c,c->d...,z->a but leave other
	 * characters unchanged
	 */
	public static void encrypt() {
		int count = 0;
		int i = 0;
		String mesg = "Hello World!";

		while (i < mesg.length()) {

			char c = mesg.charAt(i);

			count++;

			if (c >= 'a' && c <= 'z') {
				int letter = c - 'a';

				int encrypted = (letter + 1) % 26; // modulo (remainder)

				c = (char) (encrypted + 'a');

			} else
				count--;

			TextIO.put(c);
			i++;
		}
		TextIO.putln("\n" + count + " chars modified");
	}
}

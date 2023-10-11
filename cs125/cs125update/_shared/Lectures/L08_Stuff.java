public class L08_Stuff {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String original = "Bob";
		String s = original.toUpperCase();
		boolean isPalindrome = true;
		// We'll change isPalindrome to false
		// if we find a counter-example

		int lengthToCheck = s.length() / 2;
		int i = 0;
		while ((i < lengthToCheck) && isPalindrome) {
			if (s.charAt(i) != s.charAt(s.length() - i))
				isPalindrome = false;
			i++;
		}
		if (isPalindrome)
			TextIO.putln(original + " is a palindrome");

	}

}

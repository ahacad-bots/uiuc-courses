public class L12_Decode {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// Slightly modified from SP10 lecture
		// This example decodes to real letters:
		String secret = "Zfxrp";
		char[] mychars = secret.toCharArray();
		String result = "";
		for (int i = mychars.length - 1; i >= 1; i--) {
			char c = mychars[i];
			result += (char) (c - i);
		}
		TextIO.putln(result);
	}

}

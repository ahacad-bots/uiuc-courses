public class L08_Speech {

	public static void main(String[] args) {
		int lines = 0;
		int chars = 0;

		TextIO.readFile("speech.txt");
		while (!TextIO.eof()) {
			String line = TextIO.getln();
			lines = lines + 1;
			chars = chars + line.length();
		}
		TextIO.putln("Words:" + lines);
		double average = chars / ((double) lines);
		TextIO.putln("Average:" + average);

		// See readings on how to format numbers
	}

}

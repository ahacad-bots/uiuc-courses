public class L17_PrintStringArray {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		String[] data = { "Daisy", "Daisy", null, "Me" };
		String[] zombie = null;

		debugArray(zombie);
		debugArray(data);

		String[] gradeLetters = { "A+", "A", "A-", "B+", "B" };
		String example = "A";
		int index = gradeIndex(gradeLetters, example);
		System.out.println("Found " + example + " at index " + index);
	}

	public static void debugArray(String[] arr) { // pirate method
		if (arr == null) {
			return;
		}
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] != null)
				TextIO.putln(arr[i]);
		}
	}

	public static int gradeIndex(String[] grades, String letter) { // non-pirate method
		for (int i = 0 ; i < grades.length ; i ++) {
			if (letter.equals(grades[i])) {
				return i;
			}
		}
		return -1;
	}
	
}

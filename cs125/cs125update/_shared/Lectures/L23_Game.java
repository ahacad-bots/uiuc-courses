public class L23_Game {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TextIO.readFile("level1-ghostsconfig.txt");
		// first line will contain an integer - the number of sprites to create
		int numg = TextIO.getlnInt();
		
		L23_Sprite[] array = new L23_Sprite[numg];
		
		for (int i = 0 ; i < numg ; i ++) {
			String line = TextIO.getln(); //e.g. "37,54"
			array[i] = new L23_Sprite(line);
		}
	}

}

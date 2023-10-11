public class L18_Stuff {

	static final char PADDINGCHAR = ' ';
	static int count = 0;
	
	int v = 1;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s1 = "stuff"; // new String("stuff");
		String s = addPadding("Stop being stupid Congress!");
		
		L18_Stuff l18 = new L18_Stuff();
		l18.v = 7;
		l18.print();
		l18.v = 1;
		l18.print();

	}

	public void print() {
		TextIO.putln(v);
	}
	
	public static String addPadding(String s) {
		count ++;
		while (s.length() < 10) {
			s = s + PADDINGCHAR;
		}
		return s;
	}

}

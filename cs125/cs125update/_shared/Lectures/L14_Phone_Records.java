public class L14_Phone_Records {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String from[] = new String[] { "608-123-3311", "221-254-8622", null };
		String to[] = new String[] { "217-555-6200", "217-512-6200", "217-444-1337" };
		int[] duration = new int[] { 1, 25, 8 };

		for (int i = 0 ; i < from.length ; i ++) {
			String s = from[i];
			if ((s != null) && s.substring(0,3).equals("608")) {  // s.indexOf("608") == 0
				TextIO.putln("call from:" + s + " to: " + to[i] + " (dur: " + duration[i] + ")");
				
			}
		}
	}

}

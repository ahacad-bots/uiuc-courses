public class L23_Benchmark {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String s = "";
		StringBuffer sb = new StringBuffer();

		long t1 = System.currentTimeMillis();
		for (int i = 0 ; i < 100000 ; i ++) {
			sb.append("q");
		}
		long t2 = System.currentTimeMillis();
		System.out.println("SB: " + (t2 - t1));
		
		
		long t3 = System.currentTimeMillis();
		for (int i = 0 ; i < 100000 ; i ++) {
			s = s + "q";
		}
		long t4 = System.currentTimeMillis();
		System.out.println("String: " + (t4 - t3));

		
	}
}

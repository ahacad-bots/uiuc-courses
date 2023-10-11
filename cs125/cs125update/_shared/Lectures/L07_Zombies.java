public class L07_Zombies {

	public static void main(String[] args) {
		String s1 = "HELLO";
		String s2 = TextIO.getln();
		
		System.out.println(s1 + " " + s2);
		if (s1 == s2) { System.out.println("same string"); }
		if (s1.equals(s2)) { System.out.println("same contents"); }
	}

}

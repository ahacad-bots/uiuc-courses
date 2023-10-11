public class L10_FEDEX {
	public static void main(String[] args) {
		TextIO.putln("Package Weight?");
		int weight = TextIO.getlnInt();
		TextIO.putln("Urgent?");
		boolean urgent = TextIO.getlnBoolean();
		TextIO.putln("International?");
		boolean international = TextIO.getlnBoolean();

		if (international)
			TextIO.putln("FEDEX");
		else if (urgent && weight >= 150)
			TextIO.putln("RAIL");
		else if (!urgent && weight < 10)
			TextIO.putln("UPS");
		else
			TextIO.putln("DHL");
	}

}

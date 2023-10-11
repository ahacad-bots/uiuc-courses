//UIUC CS125 FALL 2013 MP. File: CaesarCipher.java, CS125 Project: Challenge3-TopSecret, Version: 2013-09-21T11:58:40-0500.295866405
/**
 * A program to search for to encrypt and decrypt lines of text. See
 * CaesarCipher.txt
 * Hints: line.charAt( int ) is useful.
 * You'll need loops, and conditions and variables
 * You'll need to read the Test cases to understand how your program should work.
 * Good Programming Hints: "DRY: Don't Repeat Yourself"
 * Try to make your program as short as possible.
 * TODO: add your netid to the line below
 * @author put-your-pliu15-here
 */
public class CaesarCipher {
public static boolean f (int shift){
	return (shift >= 1 && shift <= 25 ) || (shift <= -1 && shift >= -25);
}
	public static void main(String[] strings) {
		int shift = 0;
//		boolean f;
//		f = (shift >= 1 && shift <= 25 ) || (shift <= -1 && shift >= -25);
		while(!f(shift) && (shift != 999) && (shift != -999)){
			TextIO.putln("Please enter the shift value (between -25..-1 and 1..25)");
			shift = TextIO.getlnInt();//Ask the user for the offset to use
			if ( (!f(shift)) && (shift != 999) && (shift != -999) )
				TextIO.putln(shift + " is not a valid shift value.");
			else if((f(shift)) && (shift != 999) && (shift != -999)) {
				TextIO.putln("Using shift value of " + shift);
			}
		}
		int m;
		
		if((shift == 999) || (shift == -999)){
			TextIO.putln("Using position shift");
		TextIO.putln("Please enter the source text (empty line to quit)");
		String s = TextIO.getln();
		m = s.length()/26;
		while(!s.equals("")){ //result is from me. Should exit loop when USER string is empty.
			String result = "";
			TextIO.putln("Source   :" + s);
			s = s.toUpperCase();//Convert the line into uppercase then process the line using the shift offset.
			for(int i = 0; i < s.length(); i++){
				char c = s.charAt(i);
				if(c >= 'A' && c <= 'Z') c = (char)('A' + (c - 'A' + (shift/999)*i + 26*m)%26);
				result += c;}
			TextIO.putln("Processed:" + result);
			
			TextIO.putln("Please enter the source text (empty line to quit)"); //Asking for input
			s = TextIO.getln();
		}
		TextIO.putln("Bye.");
		}
		
		if((shift != 999) && (shift != -999)){
		TextIO.putln("Please enter the source text (empty line to quit)");
		String s = TextIO.getln();
		while(!s.equals("")){ //result is from me. Should exit loop when USER string is empty.
			String result = "";
			 
			TextIO.putln("Source   :" + s);
			s = s.toUpperCase();//Convert the line into uppercase then process the line using the shift offset.
			for(int i = 0; i < s.length(); i++){
				char c = s.charAt(i);
				if(c >= 'A'&& c <= 'Z') c = (char)('A' + (c - 'A' + shift + 26)%26);
				result += c;}
			TextIO.putln("Processed:" + result);
			
			TextIO.putln("Please enter the source text (empty line to quit)"); //Asking for input
			s = TextIO.getln();
		}
		TextIO.putln("Bye.");
		}
		//throw new RuntimeException ("Et tu Brutus?");
	}

}

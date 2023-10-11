//UIUC CS125 FALL 2013 MP. File: CipherBreaker.java, CS125 Project: Challenge3-TopSecret, Version: 2013-09-21T11:58:40-0500.295866405
/**
 * See CipherBreaker.txt for instructions.
 * TODO: add your netid to the line below
 * 
 * @author put-your-pliu15-here
 */
public class CipherBreaker {

	public static void main(String[] args) {
		int digits = 0;
		int spaces = 0;
		int punctation = 0;
		int length;
		char c;
		int count = 0;
		int[] alb = new int[127];
		
		TextIO.putln("Text?");
		String line = TextIO.getln();
		TextIO.putln(line);
		
		line = line.toUpperCase();
		length = line.length();
		
		for(int i = 0; i < length; i++){
			c = line.charAt(i);
			if (c >= 'A' && c <= 'Z'){
				alb[c-'A'] ++;
			}
				else if (c >= '0' && c <= '9'){
					digits ++;
				}
				else if (c == ' '){
					spaces ++;
				}
				else if (c == '\"' || c == '\'' || c == '-' || c == '.' || c == '!' || c == ','){
					punctation ++;
				}
			}
		for(int i = 0; i<26;i++){
			if(alb[i]!=0){
				TextIO.putln((char)(i+ 'A') + ":" + alb[i] );
			}
		}
		if(digits>0)TextIO.putln("DIGITS:" + digits);//count the number of digits
		if(spaces>0)TextIO.putln("SPACES:" + spaces);//count the number of spaces
		if(punctation>0)TextIO.putln("PUNCTUATION:" + punctation);//count the number of punctuation marks 
	}
}
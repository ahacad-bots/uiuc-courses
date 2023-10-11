//UIUC CS125 FALL 2013 MP. File: CallAStaticMethod.java, CS125 Project: Challenge5-DataStructures, Version: 2013-10-14T15:42:09-0500.735397010
/* 
 * @author pliu15
 */
/**
 * Prints out only lines that contain an email address Each printed line is
 * justified to right by prepending the text with '.' characters The minimum
 * width of the line including padding is 40 characters. See the test case for
 * example input and expected output.
 */
class CallAStaticMethod {

	public static void main(String[] args) {

		while (!TextIO.eof()) {
			String line = TextIO.getln();
			if (ExampleClassMethods.isEmailAddress(line)){
				if(line.length() <  40){
				 line = ExampleClassMethods.createPadding('.',40-line.length()) + line;
				}
			// Use ExampleClassMethods
			// 'isEmailAddress' and 'createPadding' to complete this method
			TextIO.putln(line);
			}
		}

	}
}

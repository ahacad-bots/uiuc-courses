//UIUC CS125 FALL 2013 MP. File: FindScriptLine.java, CS125 Project: Challenge2-Hollywood, Version: 2013-09-17T09:57:36-0500.928912140
/**
 * A program to search for specific lines and print their line number.
 * See FindScriptLine.txt for more details
 * TODO: add your netid to the line below
 * @author put-your-pliu15-here
 */
public class FindScriptLine {

	public static void main(String[] args) {
// TODO: Implement the functionality described in FindScriptLine.txt
// TODO: Test your code manually and using the automated unit tests in FindScriptLineTest	
	
//		String input = "";
		boolean match = false;
		int i = 1;
		
		TextIO.putln("Please enter the word(s) to search for");
		String input = TextIO.getln();
		TextIO.putln("Searching for \'" + input + "\'");
		TextIO.readFile("thematrix.txt");
		
		
		String line = TextIO.getln();
		
		while(TextIO.eof() == false){
			if(line.indexOf("")>=0)
				match = false;
			if(line.indexOf(input)>=0 || line.indexOf(input.toLowerCase())>=0 || line.indexOf(input.toUpperCase())>=0)
				match = true;
			
			if(match) TextIO.putln(i + " - " + line);
			
			line = TextIO.getln();
			line = line.trim();
			i ++;
		}
		TextIO.putln("Done Searching for \'" + input + "\'");		
	}
}

		
		
		
//		boolean output=false; 
//		String words=""; 
//		
//		TextIO.putln("Please enter the word(s) to search for");
//		words = TextIO.getln();
//		TextIO.putln("Searching for \'" + words + "\'");
//		TextIO.readFile("thematrix.txt"); 
//		
//		output = false; 
//		
//		
//		int i = 1;
//		
//		String line = TextIO.getln();
//	
//		while (false == TextIO.eof()) {
//			
//			
//			//output = false;
//			if(line.indexOf("") >= 0)	
//				output = false;//
//			
//			if (line.indexOf(words) >= 0 || line.indexOf(words.toLowerCase()) >= 0 || line.indexOf(words.toUpperCase()) >= 0)
//				output = true;
//			
//			if (output)
//				TextIO.putln(i + " - " + line); 
//			
//			line = TextIO.getln();
//			line = line.trim();
//			i++;
//			
//		}
//		TextIO.put("Done Searching for \'" + words + "\'");
//	}
//}

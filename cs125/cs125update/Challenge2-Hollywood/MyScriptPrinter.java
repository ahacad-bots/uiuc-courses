//UIUC CS125 FALL 2013 MP. File: MyScriptPrinter.java, CS125 Project: Challenge2-Hollywood, Version: 2013-09-17T09:57:36-0500.928912140
/**
 * A program to print one actor's lines. 
 * See ScriptPrinter.txt for more information.
 * TODO: add your netid to the line below
 * @author put-your-pliu15-here
 */
public class MyScriptPrinter {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
//Your users have requested the following fixes.
//* "Before processing the script  print the summary line "XXX's lines:"
//where XXX is the name of the character (always in uppercase)."
//* "Print three dashes '---' after processing the script, 
//so I'm sure that the program finished correctly." 
//* "It only works if I enter character's name in uppercase. 
//NEO/neo/Neo should all work."
//* "It only works for the first line - it needs to stop printing when
//it gets to a blank line"

		boolean output = false;
		String line = "";
		
		TextIO.putln("Which character's lines would you like? (NEO,MORPHEUS,ORACLE)");
		String character = TextIO.getln();
		character = character.toUpperCase();
		
		TextIO.readFile("thematrix.txt");
		TextIO.putln(character + "'s lines:");
		
		while(TextIO.eof() == false){
			line = TextIO.getln();
			line = line.trim();
			
			if(output)
				TextIO.putln(character + ":\""  + line + "\"");
			if(line.indexOf("") >=0 )
				output = false;
			if(line.indexOf(character) >= 0)
				output = true;
		}
	TextIO.put("---");	
	}
}
//		
//		boolean output=false; //Set to true when we find the desired character
//		String name=""; // Only print lines for this character
//		
//		TextIO.putln("Which character's lines would you like? (NEO,MORPHEUS,ORACLE)");
//		name = TextIO.getln();
//		name = name.toUpperCase();
//		
//		TextIO.readFile("thematrix.txt"); // stop reading from the keyboard- use the script
//
//		TextIO.putln(name + "'s lines:");//TODO: Print the name here (see ScriptPrinter.txt example output for format)
//		
//		output = false; // initially don't print anything
//
//		// This loop will read one line at a time from the script until it
//		// reaches the end of the file and then TextIO.eof() will return true.
//		// eof means end-of-file
//		while (false == TextIO.eof()) {
//			String line = TextIO.getln(); 
//			line = line.trim();// Read the next line
//
//			if (output)
//				TextIO.putln(name + ":\"" + line +"\""); // Only print the line if 'output' is true
//			//TODO: Re-order the three if statements so the output is correct
//			if(line.indexOf("") >= 0)//TODO: If it's a blank line set 'output' to false		
//				output = false;//TODO: Correct the output format (see ScriptPrinter.txt example output)
//			
//			if (line.indexOf(name) >= 0)
//				output = true; // We found the character's name, time to start printing their lines
//
//		
//		}
//		TextIO.put("---");//TODO: Print 3 dashes here to indicate processing is complete
//	}
//}

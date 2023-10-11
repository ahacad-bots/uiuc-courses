//UIUC CS125 FALL 2013 MP. File: LinkedList.java, CS125 Project: Challenge6-RecursionSee, Version: 2013-11-05T17:24:16-0600.569335634
/**
 * @author replace-with-your-pliu15-here
 *
 */
public class LinkedList {
	// Get and Set methods are NOT necessary!

	private LinkedList next; 	
	private final String word;

	/** Constructs this link.
	 * @param word ; a single word (never null).
	 * @param next ; the next item in the chain (null, if there are no more items).
	 */
	public LinkedList(String word, LinkedList next) {
		this.word = word;
		this.next = next;
	}

	/**
	 * Converts the entire linked list into a string representation.
	 */
	public String toString() {
		if (next == null)
			return word;// BASE CASE; no more recursion required

		// Recursive case:
		String restOfString = next.toString(); // Forward Recursion
		return word + ";" + restOfString;
	}

	/**
	 * Returns the number of entries in the linked list.
	 * @return number of entries.
	 */
	public int getCount() {
		if (next == null)
			return 1; // BASE CASE; no more recursion required!

		// Recursive case:
		return 1 + next.getCount(); // Forward recursion
	}
	
	/** Creates a new LinkedList entry at the end of this linked list.
	 * Recursively finds the last entry then adds a new link to the end.
	 * @param word
	 */
	public void append(String word) {
		//throw new IllegalArgumentException("Not Yet Implemented");
		if (this.next == null){
			LinkedList temp = new LinkedList(word, null);
			this.next = temp;
		}
		else next.append(word);
	}
	/**
	 * Recursively counts the total number of letters used.
	 * 
	 * @return total number of letters in the words of the linked list
	 */
	public int getLetterCount() {
		if (next == null)
			 return word.length();
		 int letter = next.getLetterCount();
		 return letter + word.length();
		//throw new IllegalArgumentException("Not Yet Implemented");
		// returns the total number of letters. word1.length() +
		// word2.length()+...
		// "A" -> "CAT" -> null returns 1 + 3 = 4.
	}

	/**
	 * Recursively searches for and the returns the longest word.
	 * @return the longest word i.e. word.length() is maximal.
	 */
	public String getLongestWord() {
		// recursive searches for the longest word
		if (next==null)
			return word;
		String s = next.getLongestWord();
		if (s.length() >= word.length()) return s; 
		else return word;
		//throw new IllegalArgumentException("Not Yet Implemented");
	}

	/** Converts linked list into a sentence (a single string representation).
	* Each word pair is separated by a space.
	* A period (".") is appended after the last word.
	* The last link represents the last word in the sentence.*/
	public String getSentence() {
		if (next == null)
			return word + ".";// BASE CASE; no more recursion required!
		
		// Recursive case:
				String remainString = next.getSentence(); 
				return word + " " + remainString;// Forward Recursion
		//throw new IllegalArgumentException("Not Yet Implemented");
	}
	
	/**
	 * Converts linked list into a sentence (a single string representation).
	 * Each word pair is separated by a space. A period (".") is appended after
	 * the last word. The last link represents the first word in the sentence
	 * (and vice versa). The partialResult is the partial string constructed
	 * from earlier links. This partialResult is initially an empty string. 
	 */
	public String getReversedSentence(String partialResult) {
		if ((next == null) && (partialResult != ""))
			return word;// BASE CASE; no more recursion required
        if (next==null) return word + ".";
		
        // Recursive case:
		String remainString = next.getReversedSentence(word); // Forward Recursion
		if (partialResult == "") return remainString + " " + word + ".";
		return remainString + " " + word;
		//throw new IllegalArgumentException("Not Yet Implemented");
	}
	

	/** Creates a linked list of words from an array of strings.
	 * Each string in the array is a word. */
	public static LinkedList createLinkedList(String[] words) {
		LinkedList tmp = new LinkedList(words[words.length-1], null);
		for (int i=words.length-2; i >= 0; i--){
			LinkedList t = tmp;
			tmp = new LinkedList(words[i], t);
		}
		return tmp;

		//throw new IllegalArgumentException("Not Yet Implemented");
		// Hint: This is a wrapper method. You'll need to create your
		// own recursive method.
		// Yes this is possible _without_ loops!
	}

	/**
	 * Searches for the following word in the linked list. Hint: use .equals not ==
	 * to compare strings.
	 * 
	 * @param word
	 * @return true if the linked list contains the word (case sensivitive)
	 */
	public boolean contains(String word) {
		if (next == null)
			return this.word == word;// BASE CASE; no more recursion required
		
		// Recursive case:
		boolean f = next.contains(word); 
		if (f == true) 
			return true;
		else 
			return this.word == word;// Forward Recursion
		//throw new IllegalArgumentException("Not Yet Implemented");
	}

	/** Recursively searches for the given word in the linked list.
	 * If this link matches the given word then return this link.
	 * Otherwise search the next link.
	 * If no matching links are found return null.
	 * @param word the word to search for.
	 * @return The link that contains the search word.
	 */
	public LinkedList find(String word) {
		if ((next == null) && (this.word != word)) 
			return null;
	    if ((next == null) && (this.word == word)) 
	    	return this;
        if (this.word == word) 
        	return this; 
        else 
        	return next.find(word);
		//throw new IllegalArgumentException("Not Yet Implemented");

	}

	/**
	 * Returns the last most link that has the given word, or returns null if
	 * the word cannot be found.
	 * Hint: Would forward recursion be useful?
	 * @param word the word to search for.
	 * @return the last LinkedList object that represents the given word, or null if it is not found.
	 */
	public LinkedList findLast(String word) {
		if ((next == null) && (this.word == word)) 
			return this;
		if (next == null) 
			return null;
		LinkedList tmp = new LinkedList(null, null);
		tmp = next.findLast(word);
		if ((this.word == word) && (tmp == null)) 
			tmp = this;
		return tmp;//throw new IllegalArgumentException("Not Yet Implemented");
	}

	public LinkedList insert(String string) {
		if (this.word.compareTo(string) < 0) {
			this.append(string);
			return this;
		}
		else {
			LinkedList tmp = new LinkedList(string, this);
			return tmp;
		}
		//throw new IllegalArgumentException("Not Yet Implemented");
	}

}

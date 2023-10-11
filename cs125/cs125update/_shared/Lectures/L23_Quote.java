
public class L23_Quote {
	
	// This object is immutable - you can't change it 
	// after you've created it.
	// There are no public methods that can be used
	// AND we made the internal state of the object private
	private String author;
	private String text;
	
	public L23_Quote(String auth, String quoteText) {
		this.author = auth;
		this.text = quoteText;
	}
	
	public String toString() {
		return "\"" + text  + "\" by " + author;
	}
	
	public String getAuthor() { return this.author; }
	public String getText() { return this.text; }
}

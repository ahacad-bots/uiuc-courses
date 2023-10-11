//UIUC CS125 FALL 2013 MP. File: Stack.java, CS125 Project: Challenge5-DataStructures, Version: 2013-10-14T15:42:09-0500.735397010
/* 
 * @author pliu15
 */
public class Stack {
	private int i = -1;
	private String[] top = new String[666]; 
	/** Adds a value to the top of the stack.*/
	public void push(String value){
		this.i ++;
		this.top[i] = value;
		//throw new RuntimeException("Elevator stuck. Abort Retry Fail?");
	}
	
	/** Removes the topmost string. If the stack is empty, returns null. */
	public String pop() {
		String s = null;
		if (this.i + 1 > 0){
			s = this.top[this.i];
			this.i --;
		}
		return s;
		//throw new RuntimeException("Ones and Zeros. Mostly.");
	}
	
	/** Returns the topmost string but does not remove it. If the stack is empty, returns null. */
	public String peek() {
		String s = null;
		if (this.i + 1 > 0)
			s = this.top[this.i];
		return s;
		//throw new RuntimeException("Don't peek. It's too scary");
	}
	
	/** Returns true iff the stack is empty */
	public boolean isEmpty() {
		return ((this.i + 1) == 0);
		//throw new RuntimeException("Need more");
	}

	/** Returns the number of items in the stack. */
	public int length() {
		return (this.i + 1);
		//throw new RuntimeException("Must be relative");
	}
	
	/** Returns a string representation of the stack. Each string is separated by a newline. Returns an empty string if the stack is empty. */
	public String toString() {
		String s = "";
		for (int j = 0; j < this.i + 1; j++)
			s = s + this.top[j] + "\n";
		return s;
		//throw new RuntimeException("Rope is thicker but String is quicker");
	}
}

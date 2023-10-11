//UIUC CS125 FALL 2013 MP. File: GridCounting.java, CS125 Project: Challenge7-RecursiveKnight, Version: 2013-11-12T10:44:04-0600.496641397
/**
	 * @author pliu15
	 */
public class GridCounting {
	/** Returns the total number of possible routes (paths) from
	 * (x,y) to (tx,ty).
	 * There are only three valid kinds of moves:
	 *  Increment x by one.
	 *  Increment x by two.
	 *  Increment y by one.
	 *  
	 *  Hint: You'll need to test two base cases.
	 */
	public static int count(int x,int y, int tx, int ty) {
		int result = 0;
		if ((x == tx) && (y == ty)) 
			return 1;
		if ((x > tx) || (y > ty)) return 0;
		result = result + count(x + 1, y, tx, ty);
		result = result + count(x + 2, y, tx, ty);
		result = result + count(x, y + 1, tx, ty);
		return result;//return 57;
	}
}

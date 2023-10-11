//UIUC CS125 FALL 2013 MP. File: MazeRunner.java, CS125 Project: Challenge7-RecursiveKnight, Version: 2013-11-12T10:44:04-0600.496641397
/**
	 * @author pliu15
	 */
public class MazeRunner {

	private int x, y;

	/** Initializes the MazeRunner with the x,y values */
	public MazeRunner(int x, int y) {	
		this.x = x;
		this.y = y;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}


	/** Moves the runner one unit. No error checking is performed.
	 * 'N':go North (increment y), S:decrement y, E(increment x), W(decrement x)
	 * character values other than N,S,E or W are ignored.
	 */
	void moveOne(char dir) {
		if (dir=='N') this.y++;
		if (dir=='S') this.y--;
		if (dir=='E') this.x++;
		if (dir=='W') this.x--;
//		 TODO: Implement moveOne
	}
	/** Returns true if this maze runner is on the same (x,y) square
	 * as the parameter. Assumes that the parameter is non-null.
	 */
	public boolean caught(MazeRunner other) {
		return (this.x == other.getX()) && (this.y == other.getY()); //return false; // TODO: Implement caught
	}

	/**
	 * Uses recursion to find index of the shortest string.
	 * Null strings are treated as infinitely long.
	 * Implementation notes:
	 * The base case if lo == hi.
	 * Use safeStringLength(paths[xxx]) to determine the string length.
	 * Invoke recursion to test the remaining paths (lo +1)
	 */
	static int findShortestString(String[] paths, int lo, int hi) {
		if (lo == hi) return lo;
		int i = findShortestString(paths, lo + 1, hi);
		int s1 = safeStringLength(paths[lo]);
		int s2 = safeStringLength(paths[i]);
		int min = s1 < s2 ? lo:i;
		return min;//return -1; // TODO: findShortestString
	}

	/** Returns the length of the string or Integer.MAX_VALUE
	 * if the string is null.
	 * @param s
	 * @return
	 */
	static int safeStringLength(String s) {
		int l;
		if (s == null) 
			l = Integer.MAX_VALUE; 
		else 
			l = s.length();
		return l;//return -1;//TODO: safeStringLength
	}


	/* Returns a string representation of the shortest path between
	 * (x,y) and (tx,ty). e.g. a result of "NNEE"
	 * means to travel from (x,y) -> (tx,ty) go North twice, then East twice.
	 * blocked is a square boolean grid of points that cannot be used.
	 * If(x,y) are invalid coords (outside of the grid array) this method returns null.
	 * If(x,y) is on a blocked square, this method returns null. Otherwise,
	 * If(x,y) are already the same as the target position, returns an empty string.
	 * If there is no path between (x,y) and (tx,ty) the method returns null.
	 * 
	 * Implementation notes:
	 * Use the statements above for the base cases.
	 * For the recursion part:
	 * 1. Set the current position to blocked (so that the recursive method does not
	 * attempt to re-use this square again)
	 * 2. Collect all paths from the NSEW neighbors
	 * 3. Reset the current blocked position to false.
	 * 4. Use findShortestString to determine the shortest path
	 * 5. If its non-null then PREPEND the compass direction of that neighbor's path.
	 * e.g. if the Northern neighbor returned "EWWS" 
	 * the East neighbor returned "NWWWWWWWSEEEESS" and W and S Neighbor return null
	 * then return "N" + "EWWS"
	 * Otherwise, just return null as none of the neighbors found a path.
	 */
	public static String shortestPath(int x, int y, int tX, int tY,
			boolean blocked[][]) {
		int lx = blocked.length;
	    int ly = blocked[0].length;
	    String[] paths = new String[4];//"N","S","E","W"
	    if(((x >= lx) || (x < 0)) || ((y >= ly) || (y < 0)))
	        return null;
	    if((tX > lx) || (tX < 0) || (tY > ly) || (tY < 0))
	    	return null;//If(x,y) are invalid coords (outside of the grid array) this method returns null.If there is no path between (x,y) and (tx,ty) the method returns null.
	    if(blocked[x][y])
	        return null;//blocked is a square boolean grid of points that cannot be used
	    if(x == tX && y == tY)
	        return "";//If(x,y) are already the same as the target position, returns an empty string.
	    blocked[x][y] = true;//  Set the current position to blocked (so that the recursive method does not attempt to re-use this square again)
	    paths[0] = shortestPath(x, y + 1, tX, tY, blocked);//N
	    paths[1] = shortestPath(x, y - 1, tX, tY, blocked);//S
	    paths[2] = shortestPath(x + 1, y, tX, tY, blocked);//E
	    paths[3] = shortestPath(x - 1, y, tX, tY, blocked);//W// TODO: BASE CASES HERE
		//blocked[x][y] = true;
		//String[] paths = { 
			//TODO: COLLECT RECURSIVE RESULTS HERE
		//};
		//blocked[x][y] = false;
	    blocked[x][y] = false;//Reset the current blocked position to false.
	    int index = findShortestString(paths, 0, 3);// TODO: Use findShortestString on paths
	    String minimalpath = paths[index];
	    if(minimalpath != null){
	        if(index == 0)
	            minimalpath = "N" + minimalpath;
	        if(index == 1)
	            minimalpath = "S" + minimalpath;
	        if(index == 2)
	            minimalpath = "E" + minimalpath;
	        if(index == 3)
	            minimalpath = "W" + minimalpath;
	        return minimalpath;
		// TODO: Use findShortestString on paths
		// TODO: Return correct string with Compass direction prepended (or null)
	    }
	    else return null;//return "run away!";
	}

	/** Moves the runner towards the target position, if the
	 * shortest path can be found between the current and target position.
	 * Implementation notes: calls shortestPath, 
	 * if result is not null then send the first char to moveOne()
	 * Hint: watch out for the empty string when target = current position...
	 */
	public void chase(boolean maze[][], int targetX, int targetY) {
		// TODO: Implement chase
		if(this.x==targetX && this.y==targetY)
			return ;
		String minimalpath = shortestPath(this.x, this.y, targetX, targetY, maze);
		if(minimalpath != null){
			moveOne(minimalpath.charAt(0));
		}// Use shortestPath, string.charAt,  moveOne
	}

}

//UIUC CS125 FALL 2013 MP. File: RobotLink.java, CS125 Project: Challenge7-RecursiveKnight, Version: 2013-11-12T10:44:04-0600.496641397
/**
	 * @author pliu15
	 */
public class RobotLink {

	private RobotLink next; 	
	private final Robot robot;

	public Robot getRobot() {
		return robot;
	}
	/** Constructs this link.
	 * @param next ; the next item in the chain (null, if there are no more items).
	 * @param robot ; a single robot (never null).
	 */
	public RobotLink(RobotLink next,Robot robot) {
		this.robot = robot;
		this.next = next;
	}

	/**
	 * Returns the number of entries in the linked list.
	 * @return number of entries.
	 */
	public int count() {
		if (next == null)
			return 1; // BASE CASE; no more recursion required!

		// Recursive case:
		return 1 + next.count();
	}
	/**
	 * Counts the number of flying robots in the linked list.
	 * Hint: robot.isFlying is useful here.
	 */
	public int countFlyingRobots() {
		int count = 0;
		if (this.robot.isFlying()) 
			count = 1; 
		if (next == null)
			return count; // BASE CASE;
		
		// Recursive case:
		return count + next.countFlyingRobots();//return -1;
	}
	/**
	 * Counts the number of flying robots upto and excluding a sad robot.
	 * (i.e. do not count the sad robot if it is flying).
	 * If there are no sad robots this function will return the same value as countFlyingRobots().
	 * Hint: robot.isHappy() is useful.
	 */
	public int countFlyingRobotsBeforeSadRobot() {
		int count = 0;
		if (this.robot.isFlying()) count = 1;
		if (!this.robot.isHappy()) return 0;
		if (next == null)
			return count; // BASE CASE; 
        
		// Recursive case:
		return count + next.countFlyingRobotsBeforeSadRobot();
//return -1;
	}
	/** Creates a new LinkedList entry at the end of this linked list.
	 * Recursively finds the last entry then adds a new link to the end.
	 * @param robot - the robot value of the new last link
	 */
	public void append(Robot robot) {
		RobotLink tmp = this;
		while (tmp.next != null){
			tmp = tmp.next;
		}
		tmp.next = new RobotLink(null, robot);
	}
	/**
	 * Returns the first flying unhappy robot, or null
	 * if there are not robots that are flying and unhappy.
	 * @return
	 */
	public Robot getFirstFlyingUnhappyRobot() {
		RobotLink tmp = this;
		while (tmp != null){
			if (tmp.robot.isFlying() && (!tmp.robot.isHappy()))
				return tmp.robot;
			tmp = tmp.next;
		}
		return null;
	}
	/**
	 * Returns the last flying unhappy robotn the linked list, or null
	 * if there are not robots that are flying and unhappy.
	 * @return
	 */
	public Robot getLastFlyingUnhappyRobot() {
		Robot tmp = null;
		if (next == null) 
			return tmp;
		tmp = this.next.getLastFlyingUnhappyRobot();
		if (tmp == null && this.robot.isFlying() && (!this.robot.isHappy())) 
			return this.robot;
		return tmp;//return null;
	}
	/**
	 * Returns a reference to the happy most distant explorer.
	 * Returns null if there are no happy robots
	 * @return reference to the most distant happy robot
	 */
	public Robot findHappyRobotFurthestFromHome() {
		Robot tmp = null;
		if (tmp == null && this.robot.isHappy()) 
			return this.robot;
		if (next == null) 
			return tmp;
		tmp = this.next.findHappyRobotFurthestFromHome();
		return tmp;//return null;
	}
	/**
	 * Returns true if linked list contains the robot.
	 * Hint: Use robot.equals(other).
	 * @param robot
	 * @return
	 */
	public boolean contains(Robot other) {
		boolean t = false;
		if ((this.robot.equals(other)) && (t == false))
			return true;
		if (next == null) 
			return t;
		t = this.next.contains(other);
		return t;//return false;
	}

	
}

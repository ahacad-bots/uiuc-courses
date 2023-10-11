//UIUC CS125 FALL 2013 MP. File: Queue.java, CS125 Project: Challenge5-DataStructures, Version: 2013-10-14T15:42:09-0500.735397010
/* 
 * @author pliu15
 */
public class Queue {
	private int maxIndex = -1;
	private double [] front = new double[0];
	/** Adds the value to the front of the queue.
	 * Note the queue automatically resizes as more items are added. */
	public void add(double value) {
		this.maxIndex ++;
		double [] frontNew = new double[this.maxIndex + 1];

		for(int j = 0; j < maxIndex; j ++){	
			frontNew[j] = front[j];
		}

		frontNew[this.maxIndex] = value;
		front = frontNew;
	}
	/** Removes the value from the end of the queue. If the queue is empty, returns 0 */
	public double remove() {
		double end = 0;
		if (this.maxIndex + 1 > 0){
			end = this.front[0];
			double [] frontNew1 = new double[this.maxIndex];
			for(int j = 1; j < frontNew1.length + 1; j ++)
				frontNew1[j-1] = front[j];
			this.maxIndex --;
			front = frontNew1;
		}
		return end;
		//throw new RuntimeException("Grilled Cheese");
	}
	
	/** Returns the number of items in the queue. */
	public int length() {
		return (this.maxIndex + 1);
		//throw new RuntimeException("I am not a number; I am free man.");		
	}
	
	/** Returns true iff the queue is empty */
	public boolean isEmpty() {
		return ((this.maxIndex + 1) == 0);
		//throw new RuntimeException("The butler did it");
	}
	
	/** Returns a comma separated string representation of the queue. */
	public String toString() {
		String s = "";
		for (int j = 0; j < front.length-1; j++){
			s += front[j] + ",";
		}
		s += front[front.length-1];
		return s;
		//throw new RuntimeException("Daisy daisy daisy");
	}
}


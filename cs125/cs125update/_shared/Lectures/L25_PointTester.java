
public class L25_PointTester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		L25_Point[] somePoints = L25_Point.createPoints(1000);
		int xGty = L25_Point.countXGreaterThanY(somePoints);
		TextIO.putln(xGty);
		TextIO.putln(somePoints[0]);
	}

}

public class L25_Point {

	public static void main(String[] args) {
		L25_Point[] myPoints = new L25_Point[4];
		L25_Point p = new L25_Point(25, 23);
		myPoints[0] = p;
		TextIO.putln(p);
		L25_Point p2 = new L25_LabeledPoint("foo", 25, 23);
		myPoints[1] = p2;
		// L25_LabeledPoint lp = (L25_LabeledPoint) p2;
		// p2.printSomething();
		//((L25_LabeledPoint) p2).printSomething();
		
//		for (int ...) {
//			myPoints[i].toString();
//		}

		TextIO.putln(p2.toString());	
		TextIO.putln(p.equals(p2));
		TextIO.putln(p2.equals(p));

		L25_Point p3 = new L25_VeryLabeledPoint("bar", "foo", 24, 26);
		TextIO.putln(p3);
	}
	
	public boolean equals(Object o) {
		if (o instanceof L25_Point) {
			L25_Point p = (L25_Point) o;
			return (this.x == p.x) && (this.y == p.y);
		}
		return false;
	}
	
	protected double x, y;
	
	public double getX() { return x; }
	public double getY() { return y; }
	
//	public String toString() {
//		return "(" + x + ", " + y + ")";
//	}
//
	// new L25_Point(123.0, 456.0);
	public L25_Point(double x, double y) {
		this.x = x;
		this.y = y;
	}
	public L25_Point() {
		this(100, 100);
	}
	public L25_Point(double xy) {
		this(xy, xy);
	}
	
	public static L25_Point[] createPoints(int N) {
		L25_Point[] array = new L25_Point[N];
		for (int i = 0; i < N; i++)
			array[i] = new L25_Point(100 * Math.random(), 300 * Math.random());
		return array;
	}

	public static int countXGreaterThanY(L25_Point[] array) {
		int count = 0;
		for (int i = 0; i < array.length; i ++) {
			L25_Point p = array[i];
			if (p.getX() > p.getY())
				count ++;
		}
		return count;
	}
}

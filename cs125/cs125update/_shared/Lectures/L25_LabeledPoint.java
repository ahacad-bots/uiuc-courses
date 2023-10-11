
public class L25_LabeledPoint extends L25_Point {
	
	private String label;

	public L25_LabeledPoint(String s, double x, double y) {
		super(x, y);
		this.label = s;
	}
	
	public String toString() {
		return label + " " + super.toString();
	}
	
	public void printSomething() {
		TextIO.putln("What does the fox say?");
	}
	
	public boolean equals(Object o) {
		if (o instanceof L25_LabeledPoint && super.equals(o)) {
			L25_LabeledPoint p = (L25_LabeledPoint) o;
			return (this.label.equals(p.label));
		}
		return false;
	}
}

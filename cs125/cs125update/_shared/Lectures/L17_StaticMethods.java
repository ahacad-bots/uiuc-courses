public class L17_StaticMethods {
	public static void main(String[] args) {
		int a, b, c, sum;
		a = TextIO.getlnInt();
		b = TextIO.getlnInt();
		c = TextIO.getlnInt();
		sum = Add(a, b, c);
		sum += Add(a, b);
		System.out.println("Total is " + sum);
	}

	// static means "class method"
	// -> To execute the method you just need to
	// know the class name that the method is
	// written in. An example class method "Math.max"

	public static int Add(int x, int y, int z) {
		if ((x < 0) || (y < 0) || (z < 0)) {
			return 0;
		}
		int sum = x + y + z;
		/* else */if (sum > 1000) {
			return 1000;
		}
		return sum;
	}

	public static int Add(int x, int y) {
		// return x == -1 ? -1 : Add(x, y, 0);

		if (x == -1) {
			return -1;
		}
		return Add(x, y, 0);
	}

	public static double Add(String x, int y) {
		return y + 1.0;
	}

}

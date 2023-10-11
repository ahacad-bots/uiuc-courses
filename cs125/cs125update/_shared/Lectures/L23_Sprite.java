
class L23_Sprite {

	private int x, y, dir, shape;
	
	//so we can do...   
	//new L23_Sprite("37,412");
	
	public L23_Sprite(String s) {
		// expect "xvalue,yvalue" e.g. "37,412"
		// use Integer.parseInt, String's indexOf,substring(start,end)
		int commaPos = s.indexOf(",");
		String xStr = s.substring(0, commaPos);
		this.x = Integer.parseInt(xStr);
		String yStr = s.substring(commaPos + 1);
		this.y = Integer.parseInt(yStr);
		
		// version using the String.split() instance method.
//		String[] arr = s.split(",");
//		this.x = Integer.parseInt(arr[0]);
//		this.y = Integer.parseInt(arr[1]);
	}
	
	public String toString() {
		return "Sprite: (" + this.x + ", " + this.y + ")";
	}
	
	public static void main(String[] args) {
		L23_Sprite sprite = new L23_Sprite("37,412");
		TextIO.putln(sprite);
	}
}


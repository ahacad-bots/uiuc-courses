

public class L20_Ghost {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	// Class variables ("static in memory") are not part of each Ghost object –
	// just happen to be defined in the same java file
	private static Color DEFAULT_COLOR = Color.ORANGE;

	// Instance variables - part of each object:
	private int x, y, direction;
	private Color color = DEFAULT_COLOR;

	
	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public int getDirection() {
		return direction;
	}

	public Color getColor() {
		return color;
	}

	public void setX(int x) {
		this.x = x;
	}

	public void setY(int y) {
		this.y = y;
	}

	public void setDirection(int direction) {
		this.direction = direction;
	}

	public void setColor(Color color) {
		this.color = color;
	}

		// Instance methods - call these on an object:
		public void setXY(int xx, int yy) {
		x = xx;
		y = yy;
	}

	public boolean isTouching(Pacman p) {
		// return true if Pacman is within 16 units in X direction and within 16
		// units in the Y direction
		// Hint: use p.getX(), p.getY(), Math.abs

	}

	public void move() {
		if (direction == 0)
			this.x += 1;
		else if (direction == 1)
			this.x -= 1;

	}

	public void paint(Graphics g) {
		g.setColor(color);
		g.fillRect(this.x - 8, this.y - 8, 16, 16);
		// later when the art is ready…
		// g.drawImage(this.ghostImage, x - 8, x - 8, null);
	}

}


public class L20_Atom {
	private static final double SCALING_FACTOR = .1;
	static final int RADIUS = 20;
	static final boolean GRAVITY = true;
	
	/**
	 * @param args
	 */
	private int r = 0, g = 0, b = 255;
	private double x, y;
	private double vx, vy, radiusXX;

	public void init() {
		this.x = RADIUS + Math.random() * (Zen.getZenWidth() - RADIUS);
		this.y = RADIUS + Math.random() * (Zen.getZenHeight() - RADIUS);
		this.vx = 20 * (Math.random() - 0.5);
		this.vy = 20 * (Math.random() - 0.5);
		this.r = (int)(Math.random() * 255);
		this.g = (int)(Math.random() * 255);
		this.b = (int)(Math.random() * 255);
	}
	
	public void setColor(int r, int g, int b) {
		this.r = r; this.g = g; this.b = b;
	}
	
	public void updatePosition() {
		if (GRAVITY) {
			this.vy += .6;
		}
		double nextX = this.x + this.vx;
		double nextY = this.y + this.vy;
		if ((nextX < RADIUS) || (nextX > (Zen.getZenWidth() - RADIUS)))
			this.vx = -this.vx * .8;
		if ((nextY < RADIUS) || (nextY > (Zen.getZenHeight() - RADIUS)))
			this.vy = -this.vy * .8;
		this.x += (double) SCALING_FACTOR * this.vx;
		this.y += (double) SCALING_FACTOR * this.vy;
	}

	public void draw() {
		Zen.setColor(this.r, this.g, this.b);
		Zen.fillOval((int)this.x, (int)this.y, RADIUS, RADIUS);
	}

}

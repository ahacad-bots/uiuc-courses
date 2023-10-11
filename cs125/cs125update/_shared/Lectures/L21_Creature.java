public class L21_Creature {
	
	protected static final int SIZE = 96;

	protected int x = 2, y = 3, vx = 4, vy = 5;

	private void init(int x, int y) {
		// so you can make creatures by typing
		// new  L21_Creature(200,100)
		
		this.x = x;
		this.y = y;
		this.vx = 1;
		this.vy = 0;
	}
	
	public L21_Creature() {
		this.init(100, 200);
	}

	// a useful construcor..
	public L21_Creature(int x, int y) {
		this.init(x, y);
	}

	public L21_Creature(L21_Creature pointer) { 
		// a copy constructor takes 
		// a reference to an existing creature
		// Example use two = new L21_Creature( one );
		
		this.x = pointer.x;
		this.y = pointer.y;
		this.vx = (int) (Math.random() * 7 - 3);
		this.vy = (int) (Math.random() * 7 - 3);
	}

	public void move() {
		// move
		x += vx;
		y += vy;
		
		// 1% chance of changing direction
		if (Math.random() < 0.01) {
			vx = (int) (Math.random() * 7 - 3);
			vy = (int) (Math.random() * 7 - 3);
		}
		
		// Bounce off the walls
		if (x < 0 || x + SIZE > Zen.getZenWidth())
			vx = Math.abs(vx) * (x > 0 ? -1 : 1);

		if (y < 0 || y + SIZE > Zen.getZenHeight())
			vy = Math.abs(vy) * (y > 0 ? -1 : 1);
	}

	public void paint() {
		Zen.drawImage("creature.png", x, y, SIZE, SIZE);
	}

	public boolean isInside(int xx, int yy) {
		return (xx >= x) && (xx <= this.x + SIZE) && (yy >= y) && (yy <= y + SIZE);
	}
}

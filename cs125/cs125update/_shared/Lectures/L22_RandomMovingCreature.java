// We can extend an existing creature
public class L22_RandomMovingCreature extends L21_Creature {
	int count = 0;

//	@Override
//	public void paint() {
//		// For half the time we also draw the image (i.e. the code in L22_Creature). T
//		// The other half the time we skip drawing the image
//		count++;
//		if ((count / 32) % 2 == 0)
//			super.paint(); // call L22_Creature's paint() method
//		
//		Zen.setColor(50, 50, 255);
//		// draw two eyes
//		Zen.fillOval((int) (x + SIZE * 0.25), (int) (y + SIZE * 0.45),
//				(int) (0.2 * SIZE), (int) (0.15 * SIZE));
//		Zen.fillOval((int) (x + SIZE * 0.48), (int) (y + SIZE * 0.45),
//				(int) (0.2 * SIZE), (int) (0.15 * SIZE));
//	}

	@Override
	public void move() {
		// our move method replaces the original L22_Creature's move method
		x += (int) (Math.random() * 17 - 8);
		y += (int) (Math.random() * 17 - 8);
	}

}

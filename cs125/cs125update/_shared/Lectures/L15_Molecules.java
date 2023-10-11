public class L15_Molecules {

	public static void main(String[] args) {
		int natoms = 100;
		int radius = 20;
		double[][] posn = new double[natoms][2];
		double[][] velocity = new double[natoms][2];
		for (int i = 0; i < natoms; i++) {
			posn[i][0] = radius + Math.random() * (Zen.getZenWidth() - radius);
			posn[i][1] = radius + Math.random() * (Zen.getZenHeight() - radius);
			velocity[i][0] = 20 * (Math.random() - 0.5);
			velocity[i][1] = 20 * (Math.random() - 0.5);
		}
		while (true) {
			int maxX = Zen.getZenWidth() - radius;
			int maxY = Zen.getZenHeight() - radius;

			for (int i = 0; i < natoms; i++) {
				velocity[i][1] += .6;
				if (posn[i][0] + velocity[i][0] < radius
						|| posn[i][0] + velocity[i][0] > maxX)
					velocity[i][0] = -velocity[i][0] * .8;
				if (posn[i][1] + velocity[i][1] < radius
						|| posn[i][1] + velocity[i][1] > maxY)
					velocity[i][1] = -velocity[i][1] * .8;
				posn[i][0] += .1 * velocity[i][0];
				posn[i][1] += .1 * velocity[i][1];
				if (i == 0)
					Zen.setColor(255, 255, 255);
				else
					Zen.setColor(0, 0, 255); // * (posn[i][1]) );
				Zen.fillOval((int) posn[i][0], (int) posn[i][1], radius, radius);
			}

			Zen.flipBuffer();
			Zen.sleep(10);
		}
	}
} // Spot the error? And what about efficient collision detection?


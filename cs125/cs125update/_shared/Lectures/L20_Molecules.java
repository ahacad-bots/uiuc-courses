public class L20_Molecules {
	static L20_Atom[] atoms;
	static final int natoms = 100;
	
	public static void main(String[] args) {
		atoms = new L20_Atom[natoms];
		for (int i = 0; i < natoms; i++) {
			atoms[i] = new L20_Atom();
			atoms[i].init();
		}
		
		while (true) {
			for (int i = 0; i < natoms; i++) {
				atoms[i].updatePosition();
				atoms[i].draw();
			}

			Zen.flipBuffer();
			Zen.sleep(10);
		}
	}
} // Spot the error? And what about efficient collision detection?


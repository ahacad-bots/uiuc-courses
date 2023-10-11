public class L21_CreatureList {

	L21_Creature[] array = new L21_Creature[0];

	public void add(L21_Creature c) {
		L21_Creature[] tmp = new L21_Creature[array.length + 1];
		for (int i = 0; i < array.length; i++) {
			tmp[i] = this.array[i];
		}
		tmp[tmp.length - 1] = c;
		// Following line does not copy the array; we just change array pointer
		// to look at the same (new) array as tmp
		this.array = tmp;
	}

	public L21_Creature find(int xx, int yy) {
		for (int i = array.length - 1; i >= 0; i--) {
			L21_Creature c = array[i];
			if (c.isInside(xx, yy))
				return c;
		}
		return null;
	}

	public void moveAll() {
		for (int i = 0; i < array.length; i++)
			array[i].move();

	}

	public void drawAll() {
		for (int i = 0; i < array.length; i++)
			array[i].paint();

	}

	public L21_Creature removeAt(int index) {
		L21_Creature[] tmp = new L21_Creature[array.length - 1];
		for (int i = 0; i < tmp.length; i++) {
			tmp[i] = this.array[(i < index) ? i : (i + 1)];
		}
		L21_Creature removed = this.array[index];
		// Following line does not copy the array; we just change array pointer
		// to look at the same (new) array as tmp
		this.array = tmp;
		return removed;
	}

	public int getLength() {
		return array.length;
	}
}

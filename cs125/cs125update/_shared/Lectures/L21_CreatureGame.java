
public class L21_CreatureGame {

	/**
	 * My awesome Game idea.
	 * @param args
	 */
	public static void main(String[] args) {
		
		L21_CreatureList list = new L21_CreatureList();
		
		L21_Creature zeroth = new L21_Creature();
		L21_Creature first = new L21_Creature(100, 100);
		L21_Creature second = new L21_Creature(200, 100);
		L22_RandomMovingCreature third = new L22_RandomMovingCreature( );

		
		list.add(first);
		list.add(second);
		list.add(third);

		while(Zen.isRunning()) {
			list.moveAll();
			
			L21_Creature c = list.find( Zen.getMouseX(), Zen.getMouseY());
			
			if(c != null) {
				L21_Creature copy = new L21_Creature(c);
				list.add(copy);
			}
			
			list.drawAll();
			Zen.flipBuffer();
			Zen.sleep(20);
		}

	}

}

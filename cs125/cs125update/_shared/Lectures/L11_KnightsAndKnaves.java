public class L11_KnightsAndKnaves {

	public static void main(String[] args) {
		// 0 = liar, 1 = tells the truth
		for (int person1 = 0 ; person1 < 2 ; person1 ++)
			for (int person2 = 0 ; person2 < 2 ; person2 ++) {
				// Person 1 says "Person 2 is lying"
				boolean testimony1IsTruthful = (person2 == 0);
				// Person 2: "There are two liars here"
				boolean testimony2IsTruthful = ((person1 + person2) == 0);

				boolean assertion1 = ((person1 == 1) && testimony1IsTruthful)
						|| ((person1 == 0) && !testimony1IsTruthful);

				boolean assertion2 = ((person2 == 1) && testimony2IsTruthful)
						|| ((person2 == 0) && !testimony2IsTruthful);

				TextIO.put("Person 1 is "
						+ ((person1 == 0) ? "a liar" : "truthful")
						+ ". Person 2 is "
						+ ((person2 == 0) ? "a liar" : "truthful"));
				TextIO.putln(": Fits assertion 1 and 2? " + assertion1 + ","
						+ assertion2);
			}

	}

}

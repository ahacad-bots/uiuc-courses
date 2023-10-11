public class L15_GeneticAlgorithm {

	public static void main(String[] args) {
		String quote = "...and then it occurred to me that a computer is a stupid machine with the ability to do incredibly smart things, while computer programmers are smart people with the ability to do incredibly stupid things. They are, in short, a perfect match.";
		int n = 1000; // population size
		char[][] data = new char[n][quote.length()];

		for (int generation = 0; generation < 4000; generation++) {

			char[] fittest = mostFit(data, quote);
			if (generation % 100 == 0) {
				System.out.println(fittest);
				//Zen.sleep(1000);
			}
			for (int i = 0; i < n/2; i++) {
				char[] replace = data[(int) (n * Math.random())];
				breed(replace, fittest);
			}
		}
	}

	// Breed fittest individual.
	public static void breed(char[] replace, char[] fittest) {
		for (int j = 0; j < replace.length; j++)
			if (Math.random() < 0.5)
				replace[j] = fittest[j];

		// Mutate one gene
		replace[(int) (Math.random() * replace.length)] = (char) (Math.random() * 127);
	}

	static char[] mostFit(char[][] data, String quote) {
		int result = 0, bestFitness = -1;
		for (int i = 0; i < data.length; i++) {
			int fitness = 0;
			for (int j = 0; j < quote.length(); j++)
				if (data[i][j] == quote.charAt(j))
					fitness++;

			if (fitness > bestFitness) {
				bestFitness = fitness;
				result = i;
			}
		}
		return data[result];
	}
}

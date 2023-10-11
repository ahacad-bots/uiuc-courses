//UIUC CS125 FALL 2013 MP. File: Factorial.java, CS125 Project: Challenge1-DebugMe, Version: 2013-09-10T09:58:15-0500.275417822

/**
 * A program to calculate a factorial. The given code may contain errors. Fix the
 * given code and add additional code to calculate a factorial and pass the unit
 * tests. Hint sometimes an 'int' just 'aint big enough.
 * 
 * @see Factorial-ReadMe.txt for details on how to complete this program.
 * @author insert-your-pliu15-here
 */
public class Factorial {
	public static void main(String[] args) {
		int max = 0;
		long sum = 1;
		
		while (max < 1 || max >= 21) {
			System.out.println("Enter a number between 1 and 20 inclusive.");
			max = TextIO.getlnInt();
		}
		TextIO.put(max);
		while (max>0){
			sum=sum*max;
			max=max-1;
		}
		TextIO.put("! = ");
		TextIO.putln(sum);
	}
}

//UIUC CS125 FALL 2013 MP. File: OddSum.java, CS125 Project: Challenge3-TopSecret, Version: 2013-09-21T11:58:40-0500.295866405
/**
 * Prints sum of odd numbers in a specific format.
 * TODO: add your netid to the line below
 * @author put-your-pliu15-here
 */
public class OddSum { 
/**
Example output if user enters 10:
Max?
1 + 3 + 5 + 7 + 9 = 25
25 = 9 + 7 + 5 + 3 + 1

Example output if user enters 11:
Max?
1 + 3 + 5 + 7 + 9 + 11 = 36
36 = 11 + 9 + 7 + 5 + 3 + 1

 */
	public static void main(String[] args) { 
		int temp=0;
		 int sum = 1;
		 int  Enter = TextIO.getlnInt();
		 //int[] odd = new int[Enter];
		
		 TextIO.putln("Max?");
		 TextIO.put("1");
		 for(int i = 3; i <=Enter; i+=2){
				sum += i;
			 TextIO.put( " + " + i);
		 } 
		 TextIO.putln(" = " + sum);
		 
		 TextIO.put( sum + " = ");
		 if (Enter%2 == 0)
			 temp=Enter-1;
		 else 
			 temp=Enter;
		
			 for (int j = temp; j >= 3; j-=2){
			 sum+=j;
			 TextIO.put(j + " + " );
		 }
		 TextIO.put("1");
		 //TextIO.putln(sum + " = " + odd[i] + " + ");
	  } // end of main method
	} // end of class 

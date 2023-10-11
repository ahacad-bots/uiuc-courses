//UIUC CS125 FALL 2013 MP. File: GeneAnalysis.java, CS125 Project: Challenge6-RecursionSee, Version: 2013-11-05T17:24:16-0600.569335634
/**
 * @author replace-with-your-pliu15-here
 *
 */
public class GeneAnalysis
{
	/** Wrapper method. Returns the length of the longest 
	 * common subsequence
	 */
	private static int lg1,lg2;
	private static int [][] tmp = new int[1000][1000];
	public static int score(String gene1, String gene2)
	{
		//throw new IllegalArgumentException("Not Yet Implemented");
		// Hint: Use toCharArray() to convert each string to a char array.
		 // call your recursive implementation here with
		// the genes as char arrays, starting at the end of each gene.
		lg1 = gene1.length();
		lg2 = gene2.length();
        if ((gene1.length() == 0) || ( gene2.length() == 0)) 
        	return 0;
		for (int i = 0; i <= gene1.length(); i++)
			tmp[i][0] = 0;
		for (int i = 0; i <= gene2.length(); i++)
			tmp[0][i] = 0;
		LongestCommonSubsequence(gene1.toCharArray(), gene2.toCharArray(), 1, 1);
		return tmp[gene1.length()][gene2.length()];
	}
	public static void LongestCommonSubsequence(char s[], char[] s1, int l1, int l2){
    	if (l1 <= lg1){
           if (s[l1-1] == s1[l2-1]) 
        	   tmp[l1][l2] = tmp[l1-1][l2-1] + 1;
           if (s[l1-1] != s1[l2-1]) {
            	if (tmp[l1][l2-1] >= tmp[l1-1][l2]) 
            		tmp[l1][l2] = tmp[l1][l2-1]; 
        	    else 
        	    	tmp[l1][l2] = tmp[l1-1][l2];
           }
           l2 ++;           
           if (l2 > lg2) {
        	   l2 = 1;
        	   l1 ++;
           }
           LongestCommonSubsequence(s, s1, l1, l2);
    	}             
    }
	/** Implements longest common subsequence recursive search
The recursive case is defined as
					S(i-1, j)
S(i,j) = max {		S(i,j-1)
					S(i-1,j-1)
					S(i-1,j-1) +1 if gene1[i] = gene2[j]

NB  0<=i < gene1.length
    0<=j < gene2.length

You need to figure out the base case.
	 * */
//	define a private recursive Class method 'score' that 
//	returns an integer the score.
//	The method should take four parameters- 
//	two char arrays and two integers (gene1,gene2,i,j)
//	i and j are the indices into gene1 and gene2 respectively.

}
// Use local variables to store a recursive result so that you  do not need to calculate it again.

// Do not use a loops.

//UIUC CS125 FALL 2013 MP. File: UsingPublicFieldsIsEasy.java, CS125 Project: Challenge5-DataStructures, Version: 2013-10-14T15:42:09-0500.735397010
/* 
 * @author pliu15
 */
/**
 * Complete the class method 'analyze' that takes a SimplePublicPair object as an argument
 * and returns a new SimplePublicTriple object.
 * The SimplePublicTriple needs to set up as follows:
 * x = the minimum value of 'a' and 'b'
 * y = the maximum value of 'a' and 'b'
 * description:a*b=M 
 *   where a,b, and M are replaced with the numerical values of a, b and the multiplication of a and b.
 * Your code will create a SimplePublicTriple, initializes the three fields and return a reference to the SimplePublicTriple object.
 *
 */

public class UsingPublicFieldsIsEasy {
	
	public static SimplePublicTriple analyze(SimplePublicPair in) {
		SimplePublicTriple Triple = new SimplePublicTriple();
		Triple.x = Math.min(in.a, in.b);
		Triple.y = Math.max(in.a, in.b);
		Triple.description = in.a + "*" + in.b + "=" + in.a * in.b;
		return Triple;
	}
}

//UIUC CS125 FALL 2013 MP. File: MovieSurvey.java, CS125 Project: Challenge2-Hollywood, Version: 2013-09-17T09:57:36-0500.928912140
/**
 * A program to run a simple survey and report the results. See MovieSurvey.txt
 * for more information. TODO: add your netid to the line below
 * 
 * @author put-your-pliu15-here
 */
public class MovieSurvey {
	public static void main(String[] arg) {
		// TODO: Write your program here
		// Hints :
		// Formatted output
		// http://math.hws.edu/javanotes/c2/s4.html#basics.4.4
		
		// Don't just copy paste the expected output
		// For grading purposes your code may be tested
		// with other input values.
		int Cinema_movies;
        int DVD_movies;
        int Computer_movies;
        int total;
        double Fraction_cinema;
        double Fraction_outcinema;
        
        TextIO.putln("Welcome. We're interested in how people are watching movies this year.");
        TextIO.putln("Thanks for your time. - The WRITERS GUILD OF AMERICA.");
        TextIO.putln("Please tell us about how you've watched movies in the last month.");
        TextIO.putln("How many movies have you seen at the cinema?");
        Cinema_movies = TextIO.getlnInt();
        TextIO.putln("How many movies have you seen using a DVD or VHS player?");
        DVD_movies = TextIO.getlnInt();
        TextIO.putln("How many movies have you seen using a Computer?");
        Computer_movies = TextIO.getlnInt();
  
        /* Gather responses from the user. */
      
        total = Cinema_movies + DVD_movies + Computer_movies;
        Fraction_cinema = (double)Cinema_movies/total;
        Fraction_outcinema = (double)(DVD_movies + Computer_movies)/total;
        
        TextIO.putln("Summary: " + Cinema_movies + " Cinema movies, " + DVD_movies + " DVD/VHS movies, " + Computer_movies +" Computer movies");
        TextIO.putln("Total: " + total + " movies");
        TextIO.putf("Fraction of movies seen at a cinema: %.2f%%\n", 100*Fraction_cinema); 
        TextIO.putf("Fraction of movies seen outside of a cinema: %.2f%%\n" , 100*Fraction_outcinema);
        //TextIO.putln("Good Afternoon!  This program will create");
        

	}
}

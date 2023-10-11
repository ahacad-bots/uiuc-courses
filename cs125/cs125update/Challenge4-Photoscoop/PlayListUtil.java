//UIUC CS125 FALL 2013 MP. File: PlayListUtil.java, CS125 Project: Challenge4-Photoscoop, Version: 2013-10-05T05:46:59-0500.072580587
/**
 * Add you pliu15 here..
 * @author angrave
 *
 */
public class PlayListUtil {

	/**
	 * Debug ME! Use the unit tests to reverse engineer how this method should work.
	 * Hint: Fix the formatting (shift-cmd-F) to help debug the following code
	 * @param list
	 * @param maximum
	 */
	public static void list(String[] list, int maximum) {
		if(maximum <= list.length && maximum != -1){
			for (int i = 1 ; i <= maximum; i++){      
				TextIO.putln(   ""  + i + ". " + list[i-1]);
			}
		}
		else if(maximum > list.length || maximum == -1){
			for (int i = 1 ; i <= list.length; i++){      
				TextIO.putln(   ""  + i + ". " + list[i-1]);
			}
		}
	}
	/**
	 * Appends or prepends the title
	 * @param list
	 * @param title
	 * @param prepend if true, prepend the title otherwise append the title
	 * @return a new list with the title prepended or appended to the original list
	 */
	public static String[] add(String[] list, String title, boolean prepend) {
		if (!prepend){
	    	String [] result = new String[list.length + 1];
     		for (int i = 0;i < list.length; i++)
	     		result[i]=list[i];
	    	result[list.length]=title;
		return result;
		
		}
		else{
			String[] preresult = new String[list.length + 1];
			for (int i = 1; i < list.length + 1; i++) 
				preresult[i] = list[i-1];
			preresult[0]=title;
		return preresult;
		}
		
	}
	
	/**
	 * Returns a new list with the element at index removed.
	 * @param list the original list
	 * @param index the array index to remove.
	 * @return a new list with the String at position 'index', absent.
	 */
	public static String[] discard(String[] list, int index) {
		String [] discardarray = new String[list.length-1];
        	for(int i = 0; i < index; i++){
            		discardarray[i] = list[i];
		}
        	for(int j = index;j < discardarray.length; j++){
        		discardarray[j] = list[j+1];
        	}   
        	return discardarray;
	}

}

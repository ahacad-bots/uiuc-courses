//UIUC CS125 FALL 2013 MP. File: RainGame.java, CS125 Project: PairProgramming, Version: 2013-10-01T11:21:06-0500.290569130
/**
 * @author replace-this-with-your-netids-on-this-line-here-with-a-comma-between-them
 */
public class RainGame {

	public static void main(String[] args) {
		// To get points type your netids above (CORRECTLY-Please double check your partner correctly spells your netid correctly!!)
		// Your netid is the unique part of your @illinois email address
		// Do not put your name or your UIN. 
		// REMEMBER TO COMMIT this file...
	
		int x=0, y=0, dx=0, dy=2, score = 0, level = 0, total = -1, count = -1, wrong = 0;
        String text = "";
        boolean end = false;
        long startTime =System.currentTimeMillis();
        
        

        Zen.setFont("Helvetica-16");//set Font
        while (Zen.isRunning()) {
                Zen.flipBuffer();
                if (text.length() == 0) {
                        x = (int)(Math.random() * 400);
                        y = Zen.getZenHeight() / 3;
                        dx = 0;
                        //dy = Zen.getInsets();
                        text = "" + (int) (Math.random() * 999);//put a random number
                        long elapsed = System.currentTimeMillis() - startTime;//counts time
                        startTime = System.currentTimeMillis();
                        count ++;
                        total++;
                        score += 3000 / elapsed;//the fast the time, the higher the score
                }
                
                Zen.setColor(0, 0, 255);
                Zen.fillRect(0, 0, Zen.getZenWidth(), Zen.getZenHeight());

                Zen.drawImage("turf-grass1.jpg", 0,0);
                Zen.setColor(148, 0, 211);
                Zen.drawText(text, x, y);
                
                //Zen.drawImage("turf-grass1.jpg", 0,0);
                Zen.drawText("Level: " + level,530,40);
                //Zen.drawText("Score: " + count,480,30); // delete at end
                Zen.drawText("Score: " + total,530,70);
                Zen.drawText("You only have 5 tries", 460, 430);
                Zen.drawText("Miss a line and lose 10 points", 425, 450);
                Zen.drawText("Press 'a' to Skip Level", 475, 470);
                //Zen.drawImage("turf-grass1.jpg", 0,0);

                x += dx;
                y += dy;

                // Find out what keys the user has been pressing.
                String user = Zen.getEditText();
                // Reset the keyboard input to an empty string
                // So next iteration we will only get the most recently pressed keys.
                Zen.setEditText("");
                if( wrong <= 4 && total>=0){
                        for(int i=0;i < user.length();i++) {
                                char c = user.charAt(i);
                                if(c == text.charAt(0) && !Zen.isKeyPressed('a'))
                                        text = text.substring(1,text.length());// all except first character
                                else if(Zen.isKeyPressed('a')){
                                user = Zen.getEditText();
                                y =  Zen.getZenHeight() / 3;
                                }//text = text.substring(1,text.length());
                                else wrong++;
                        }
                }
                else if(!Zen.isKeyPressed('a') || total <= 0 || wrong >= 4){
                        text = "Game over";
                        end = true;
                }

                Zen.sleep(90);// sleep for 90 milliseconds
                if (y >= Zen.getZenHeight() && !end){
                        y = Zen.getZenHeight() / 3;
                        total -= 10;
                }
                //while(dy <= 10000){

                if((count+1) % 10*level == 0){
                        level ++;
                        dy += 1;
                        count = 0;
                } 
                if(Zen.isKeyPressed('a')){
                        level ++;
                        dy ++;
                }

        }//while
}//main
}//RainGame
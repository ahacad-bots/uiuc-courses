//UIUC CS125 FALL 2013 MP. File: PixelEffects.java, CS125 Project: Challenge4-Photoscoop, Version: 2013-10-05T05:46:59-0500.072580587

/* A class to implement the various pixel effects.
 *
 * Todo: Put your netid (i.e. username) in the line below
 * 
 * @author put-your-pliu15-here
 */
public class PixelEffects {

	/** Copies the source image to a new 2D integer image */
	public static int[][] copy(int[][] source) {
		// Create a NEW 2D integer array and copy the colors across
		// See redeye code below
		int newwidth = source.length;//picture.length is the width of the picture (in pixels)
		int newheight = source[0].length;//picture[0].length is the height of the picture (in pixels).
		int [][] new2Dimage = new int [newwidth][newheight];
		for (int i = 0;i < newwidth; i++){
			for(int j = 0; j < newheight; j++){
				new2Dimage[i][j] = source[i][j];
			}
		}
		return new2Dimage; // Fix Me
	}
	/**
	 * Resize the array image to the new width and height
	 * You are going to need to figure out how to map between a pixel
	 * in the destination image to a pixel in the source image
	 * @param source
	 * @param newWidth
	 * @param newHeight
	 * @return
	 */
	public static int[][] resize(int[][] source, int newWidth, int newHeight) {
		int srcW = source.length;
		int srcH = source[0].length;
		int [][] newsize = new int [newWidth][newHeight];
		for(int tgtX = 0; tgtX < newWidth; tgtX++){
			for(int tgtY = 0; tgtY < newHeight; tgtY++){
				int srcY = (int)((tgtY/(double)newHeight)*srcH);
				int srcX = (int)((tgtX/(double)newWidth)*srcW);
				newsize[tgtX][tgtY] = source[srcX][srcY];
			}
		}
		return newsize; // Fix Me
		// Hints: Use two nested for loops between 0... newWidth-1 and 0.. newHeight-1 inclusive.
		// Hint: You can just use relative proportion to calculate the x (or y coordinate)  in the original image.
		// For example if you're setting a pixel halfway across the image, you should be reading half way across the original image too.
	}

	/**
	 * Half the size of the image. This method should be just one line! Just
	 * delegate the work to resize()!
	 */
	public static int[][] half(int[][] source) {
		int newwidth = source.length;//picture.length is the width of the picture (in pixels)
		int newheight = source[0].length;//picture[0].length is the height of the picture (in pixels).
		int tgtW = newwidth/2;
		int tgtH = newheight/2;
		int [][] halfimage = new int [tgtW][tgtH];
		for(int tgtX = 0; tgtX < tgtW; tgtX++){
			for(int tgtY = 0; tgtY < tgtH; tgtY++){
				int srcY = (int)((tgtY/(double)tgtH)*newheight);
				int srcX = (int)((tgtX/(double)tgtW)*newwidth);
				halfimage[tgtX][tgtY] = source[srcX][srcY];
			}
		}
		return halfimage; // Fix Me
	}
	
	/**
	 * Create a new image array that is the same dimesions of the reference
	 * array. The array may be larger or smaller than the source. Hint -
	 * this methods should be just one line - delegate the work to resize()!
	 * 
	 * @param source
	 *            the source image
	 * @param reference
	 * @return the resized image
	 */
	public static int[][] resize(int[][] source, int[][] reference) {
		int newwidth = reference.length;//picture.length is the width of the picture (in pixels)
		int newheight = reference[0].length;//picture[0].length is the height of the picture (in pixels).
		int [][] newresize = new int [newwidth][newheight];
		for(int tgtX = 0; tgtX < newwidth; tgtX++){
			for(int tgtY = 0; tgtY < newheight; tgtY++){
				int srcY = (int)((tgtY/(double)newheight)*source[0].length);
				int srcX = (int)((tgtX/(double)newwidth)*source.length);
				newresize[tgtX][tgtY] = source[srcX][srcY];
			}
		}
		return newresize; // Fix Me
	}

	/** Flip the image vertically */
	public static int[][] flip(int[][] source) {
		int srcW = source.length;//picture.length is the width of the picture (in pixels)
		int srcH = source[0].length;//picture[0].length is the height of the picture (in pixels).
		int tgtW = srcW;
		int tgtH = srcH;
		int [][] flipimage = new int [tgtW][tgtH];
		for(int tgtX = 0; tgtX < tgtW; tgtX++){
			for(int tgtY = 0; tgtY < tgtH; tgtY++){
				int srcY = tgtH - 1 - tgtY;
				int srcX = tgtX;
				flipimage[tgtX][tgtY] = source[srcX][srcY];
			}
		}
		return flipimage;// Fix Me
	}

	/** Reverse the image horizontally */
	public static int[][] mirror(int[][] source) {
		int srcW = source.length;//picture.length is the width of the picture (in pixels)
		int srcH = source[0].length;//picture[0].length is the height of the picture (in pixels).
		int tgtW = srcW;
		int tgtH = srcH;
		int [][] mirrorimage = new int [tgtW][tgtH];
		for(int tgtX = 0; tgtX < tgtW; tgtX++){
			for(int tgtY = 0; tgtY < tgtH; tgtY++){
				int srcX = tgtW - 1 - tgtX;
				int srcY = tgtY;
				mirrorimage[tgtX][tgtY] = source[srcX][srcY];
			}
		}
		return mirrorimage;// Fix Me
	}

	/** Rotate the image */
	public static int[][] rotateLeft(int[][] source) {
		int srcW = source.length;//picture.length is the width of the picture (in pixels)
		int srcH = source[0].length;//picture[0].length is the height of the picture (in pixels).
		int tgtW = srcW;
		int tgtH = srcH;
		int [][] rotateLeftimage = new int [tgtH][tgtW];
		for(int tgtX = 0; tgtX < tgtH; tgtX++){
			for(int tgtY = 0; tgtY < tgtW; tgtY++){
				int srcX = tgtW - 1 - tgtY;
				int srcY = tgtX;
				rotateLeftimage[tgtX][tgtY] = source[srcX][srcY];
			}
		}
		return rotateLeftimage;
	}

	/** Merge the red,blue,green components from two images */
	public static int[][] merge(int[][] sourceA, int[][] sourceB) {
		// The output should be the same size as the input. Scale (x,y) values
		// when reading the background
		// (e.g. so the far right pixel of the source is merged with the
		// far-right pixel ofthe background).
		int srcW = sourceA.length;//picture.length is the width of the picture (in pixels)
		int srcH = sourceA[0].length;//picture[0].length is the height of the picture (in pixels).
		int tgtW = srcW;
		int tgtH = srcH;
		int [][] mergeimage = new int [tgtW][tgtH];
		for(int tgtX = 0; tgtX < tgtW; tgtX++){
			for(int tgtY = 0; tgtY < tgtH; tgtY++){
				int red = (RGBUtilities.toRed(sourceA[tgtX][tgtY])+RGBUtilities.toRed(sourceB[tgtX][tgtY]))/2;
				int green = (RGBUtilities.toGreen(sourceA[tgtX][tgtY])+RGBUtilities.toGreen(sourceB[tgtX][tgtY]))/2;
				int blue = (RGBUtilities.toBlue(sourceA[tgtX][tgtY])+RGBUtilities.toBlue(sourceB[tgtX][tgtY]))/2;
				mergeimage[tgtX][tgtY] = RGBUtilities.toRGB(red, green, blue);
			}
		}
		return mergeimage;
	}

	/**
	 * Replace the green areas of the foreground image with parts of the back
	 * image
	 */
	public static int[][] chromaKey(int[][] foreImage, int[][] backImage) {
		// If the image has a different size than the background use the
		// resize() method
		// create an image the same as the background size.
		int srcW = backImage.length;//picture.length is the width of the picture (in pixels)
		int srcH = backImage[0].length;//picture[0].length is the height of the picture (in pixels).
		int tgtW = srcW;
		int tgtH = srcH;
		int [][] result= new int[tgtW][tgtH];
		resize(foreImage, backImage);// resize(int[][] source, int newWidth, int newHeight) 
		//foreImage = result;
		for(int tgtX = 0; tgtX < tgtW; tgtX++){
			for(int tgtY = 0; tgtY < tgtH; tgtY++){
				int green = foreImage[tgtX][tgtY] >> 8 & 0xff;
				int blue = foreImage[tgtX][tgtY] & 0xff;
				if(green > blue)
					result[tgtX][tgtY] = backImage[tgtX][tgtY];
				else
				{result[tgtX][tgtY]=foreImage[tgtX][tgtY];}	}
		}
		return result;
		//e.g. 0x--ffffff implies red,green and blue are all at the maximum of 255 out of 255; completely white
		//e.g. 0x--ffff00 implies red,green are strongly on  but without any blue; bright yellow
		//e.g. 0x--808080 implies red,green and blue components are all half on; gray.
		//e.g. 0x--000000 implies red,green and blue are all off; black!
	}

	/** Removes "redeye" caused by a camera flash. sourceB is not used */
	public static int[][] redeye(int[][] source, int[][] sourceB) {

		int width = source.length, height = source[0].length;
		int[][] result = new int[width][height];
		for (int i = 0; i < width; i++)
			for (int j = 0; j < height; j++) {
				int rgb = source[i][j];
				int red = RGBUtilities.toRed(rgb);
				int green = RGBUtilities.toGreen(rgb);
				int blue = RGBUtilities.toBlue(rgb);
				if (red > 4 * Math.max(green, blue) && red > 64)
					red = green = blue = 0;
				result[i][j] = RGBUtilities.toRGB(red, green, blue);
			}

		return result;
	}

	/* Upto you! do something fun to the image */
	public static int[][] funky(int[][] source, int[][] sourceB) {
		// You need to invent your own image effect
		// Minimum boring requirements to pass autograder:
		//int srcW = source.length;//picture.length is the width of the picture (in pixels)
		//int srcH = source[0].length;//picture[0].length is the height of the picture (in pixels).
		
		//int [][] a = new int[tgtW][tgtH];
		//for(int tgtX = 0; tgtX < tgtW; tgtX++){
			//for(int tgtY = 0; tgtY < tgtH; tgtY++)
				//a[tgtX][tgtY]=source[tgtX][tgtY];
		//}
		int [][] a = new int[2][2];
		/*
		int [][] result = resize(source, sourceB.length, sourceB[0].length);
		int srcW = result.length;//picture.length is the width of the picture (in pixels)
		int srcH = result[0].length;//picture[0].length is the height of the picture (in pixels).
		int tgtW = srcW;
		int tgtH = srcH;
		for(int tgtX = 0; tgtX < tgtW; tgtX++){
			for(int tgtY = 0; tgtY < tgtH; tgtY++)
				result[tgtX][tgtY]=sourceB[tgtX][tgtY];
		}*/
		// Does not ask for any user input and returns a new 2D array
		// Todo: remove this return null
		return a;
	}
}

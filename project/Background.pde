/*
 * Backgrouund image class
 */
public class Background {
	PImage backgroundImage;
	int nRepetitions;

	/*
	 * Loads the images and initializes variable
	 * @constructor
	 */
	public Background() {
		backgroundImage = loadImage("Background2.jpg");
		nRepetitions = 10;
	}

	/*
	 * Displays the repeating background
	 */
	void display() {
		imageMode(CORNER);
		for (int i = 0; i < nRepetitions; i++) {
			image(backgroundImage, 0 + i * width, 0, width, height);
		}
	}

}


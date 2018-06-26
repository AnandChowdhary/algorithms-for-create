/*
 * Backgrouund image class
 */
public class Background {
	PImage back;
	int nr;

	/*
	 * Loads the images and initializes variable
	 * @constructor
	 */
	public Background() {
		back = loadImage("Background2.jpg");
		nr = 10;
	}

	/*
	 * Displays the repeating background
	 */
	void display() {
		imageMode(CORNER);
		for (int i = 0; i < nr; i++) {
			image(back, 0 + i * width, 0, width, height);
		}
	}

}


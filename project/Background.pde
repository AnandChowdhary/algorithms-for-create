//Sets the background image;
public class Background {
	PImage back;
	int nr;

	public Background() {
		back = loadImage("Background2.jpg");
		nr = 10;
	}

	void display() {
		imageMode(CORNER);
		for (int i = 0; i < nr; i++) {
			image(back, 0 + i * width, 0, width, height);
		}
	}

}


/*
 * Class for the main catapult
 */
class Catapult {
	PVector location;

	/*
	 * Initializes variables for catapult
	 * @constructor
	 */
	public Catapult() {
		location = startLocation.copy();
	}

	/*
	 * Displays the catapult and the sling when aiming.
	 */
	void display() {
		imageMode(CENTER);
		fill(255, 0, 0);
		stroke(0);
		strokeWeight(10);
		if (aim) {
			line(mouseX, mouseY, location.x + width / 34, location.y);
			line(mouseX, mouseY, location.x - width / 34, location.y);
		} else {}
		image(catpult, width / 4, height - height / 4, width / 16, height / 2);
	}

}


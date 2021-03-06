/*
 * Class for a bubble particle
 */
public class Bubble extends Particle {
	color c;

	/*
	 * Initializes bubble variables
	 * @constructor
	 * @param {PVector} location - Location of the bubble
	 * @param {PVector} velocityOriginal - Original velocity of the bubble
	 * @param {PVector} colorOriginal - Color for the bubble based on fish
	 */
	public Bubble (PVector location, PVector velocityOriginal, color colorOriginal) {
		super(location, velocityOriginal);
		c = colorOriginal;

		// Copy, normalize, and rotate velocity
		velocity = velocityOriginal.copy();
		velocity.normalize();
		velocity.rotate(radians(180));

		// Rotate bubble by a random angle
		float angle = random(-40, 40);
		velocity.rotate(radians(angle));
		velocity.mult(random(1, 8));
	}

	/*
	 * Displays the bubble in draw() function
	 */
	void display() {
		noStroke();
		fill(c, int(alpha * 255));
		ellipse(location.x, location.y, radius, radius);
	}

}
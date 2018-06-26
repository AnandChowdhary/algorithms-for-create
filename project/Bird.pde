/*
 * Class for flying birds
 */
public class Bird {
	PVector location, velocity, acceleration;
	float size, maxSpeed;

	/*
	 * Initializes bird variables
	 * @constructor
	 * @param {float} x - X-cordinate of bird's position
	 * @param {float} y - Y-cordinate of bird's position
	 * @param {float} dx - X-cordinate of bird's speed
	 * @param {float} dy - Y-cordinate of bird's speed
	 */
	public Bird(float x, float y, float dx, float dy) {
		size = 40;
		maxSpeed = 5;
		location = new PVector(x, y);
		velocity = new PVector(dx, dy);
		acceleration = new PVector(0, 0);
	}

	/*
	 * Gives each bird motion
	 */
	void move() {
		location.add(velocity);
		velocity.add(acceleration);
		acceleration = new PVector(0, 0);
		if (location.x < size / 2) {
			location.x = 10 * width - size / 2;
		}
		if (location.x > 10 * width - size / 2) {
			location.x = size / 2;
		}
		if (location.y < size / 2) {
			location.y = height / 2 - size / 2;
			location.x = random(size / 2, 10 * width - size / 2);
		}
		if (location.y > height / 2 - size / 2) {
			location.y = size / 2;
			location.x = random(size / 2, 10 * width - size / 2);
		}
		if (velocity.mag() > maxSpeed) {
			velocity.normalize();
			velocity.mult(maxSpeed);
		}
	}

	/*
	 * Displays the bird in draw() function
	 */
	void display() {
		imageMode(CENTER);
		// Calculate angle of rotation
		float theta = velocity.heading2D() + radians(90);
		pushMatrix();
		translate(location.x, location.y);
		rotate(theta);
		image(bird, 0, 0, size, size / 2);
		popMatrix();
	}

	/*
	 * Adds acceleration to bird based on point vector
	 * @param {PVector} a - Value of acceleration to add
	 */
	void addAcceleration(PVector a) {
		acceleration.add(a);
	}

}


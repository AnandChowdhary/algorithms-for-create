/*
 * Class for projectile to be shot with the catapult
 */
public class Projectile {
	PVector location;
	PVector velocity;
	PVector acceleration;
	float deceleration;
	boolean done = false;
	boolean active = false;
	float decFricCorrection;
	float theta;

	/*
	 * Initialize projectile variables
	 * @constructor
	 */
	public Projectile() {
		location = startLocation.copy();
		velocity = new PVector(0, 0);
		acceleration = new PVector(0, 0);
		deceleration = 0.8;
		decFricCorrection = 1000;
		decFricCorrection = decFricCorrection / fps;
		decFricCorrection = decFricCorrection / realWorldCorrection;
		theta = 0;
	}

	/*
	 * Displays the projectile if it's active
	 */
	void display() {
		if (active) {
			noStroke();
			fill(255, 0, 0);
			pushMatrix();
			translate(location.x, location.y);
			rotate(theta);
			ellipse(location.x, location.y, radius, radius);
			popMatrix();
		}
	}

	/*
	 * Updates values for projectile
	 */
	void update() {
		if (active) {
			if (location.y <= height / 2 + radius / 2) //keep the projectile above ground
			{
				velocity.y = -bounceResistance * velocity.y;
				location.y = height / 2 + radius / 2;
			}
			if (acceleration.mag() > 1) {
				velocity.add(PVector.mult(acceleration, frameTime)); //adds the force of the catapult
				acceleration.mult(pow(deceleration, frameTime / decFricCorrection)); //deminishes the force of the catapult
			}
			location.add(PVector.mult(velocity, frameTime)); //adds the velocity to the location
			velocity.add(PVector.mult(gravity, frameTime)); //adds the gravity to the velocity
			velocity.mult(pow(airResistance, frameTime / decFricCorrection));
			//adds the friction to the velocity

			if (abs(
				velocity.y
			) < 2 && location.y < (height / 2 + radius)) //figure out when the projectile stopped moving
			{
				velocity.y = 0;
				location.y = height / 2 + radius / 2;
				if (abs(velocity.x) < 2) {
					velocity.x = 0;
					done = true;
				}
			}
			theta = velocity.heading2D(); //getting the angle of the projectile's direction
		}
	}

}

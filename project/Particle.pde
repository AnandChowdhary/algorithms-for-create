/*
 * Class for basic particle
 */
public class Particle {
	PVector location;
	PVector velocity;
	PVector acceleration;
	float alpha = 1.0;
	float decay;
	float radius;

	/*
	 * @constructor
	 * @param {PVector} l - Location of particle
	 * @param {PVector} v - Velocity of particle
	 */
	public Particle(PVector l, PVector v) {
		location = new PVector(l.x, l.y);
		velocity = new PVector(v.x, v.y);
		decay = random(0.8, 0.99);
		radius = random(8, 17);
	}

	/*
	* Moves the particle and updates its opacity
	*/
	void update() {
		location.add(velocity);
		alpha = alpha * decay;
	}

	/*
	* Check if the particle can be removed
	*/
	boolean remove() {
		if (alpha < 0.1) {
			return true;
		} else {
			return false;
		}
	}

}


/*
 * Class for flocking birds
 */
public class Flock {
	ArrayList<Bird> birds = new ArrayList<Bird>();
	float maxAcc = 0.25;
	float seperation = 40;
	float avoWeight = 1.2;
	float cohArea = 50;
	float cohWeight = 1;
	float aliArea = 60;
	float aliWeight = 1.2;

	/*
	 * Initializes flocking variables and functionality
	 * @constructor
	 * @param {int} size - Number of member objects in flock
	 */
	public Flock (int size) {
		float direction = int(random(-1, 2));
		while (direction == 0) {
			direction = int(random(-1, 1));
		}
		for (int i = 0; i < size; ++i) {
			birds.add(new Bird(random(0, 10 * width), random(0, height / 2), direction * random(0, 2), random(-1, 1)));
		}
	}

	/*
	 * Update all properties of flock by calling functions
	 */
	void update() {
		avoidance();
		coherance();
		alignment();
		for (int i = 0; i < birds.size(); ++i) {
			birds.get(i).move();
		}
	}

	/*
	 * Display each member of flock
	 */
	void display() {
		for (int i = 0; i < birds.size(); ++i) {
			birds.get(i).display();
		}
	}

	/*
	 * Avoid hitting other members of flock
	 */
	void avoidance() {
		for (int i = 0; i < birds.size(); ++i) {
			Bird a = birds.get(i);
			PVector avo = new PVector(0, 0);

			for (int j = 0; j < birds.size(); ++j) {
				Bird b = birds.get(j);
				if (a != b) {
					float dist = PVector.dist(a.location, b.location);
					if (dist < seperation) {
						PVector tmp = PVector.sub(a.location, b.location);
						tmp.normalize();
						if (dist < 1) {
							dist = 1;
						}
						tmp.div(dist);
						avo.add(tmp);
					}
				}
			} 
			avo.normalize(); 
			avo.limit(maxAcc);
			avo.mult(avoWeight);
			a.addAcceleration(avo);
		} 
	}

	/*
	 * Travel as one coherent entity in flock
	 */
	void coherance() {
		for (int i = 0; i < birds.size(); ++i) {
			int counter = 1;
			Bird a = birds.get(i);
			PVector avLocation = a.location.copy();
			for (int j = 0; j < birds.size(); ++j) {
				Bird b = birds.get(j);
				
				if (a != b) {
					float dist = PVector.dist(a.location, b.location);
					if (dist < cohArea) {
						avLocation.add(b.location);
						counter++;
					}
				}
			} 
			avLocation.div(counter);
			PVector coh = PVector.sub(avLocation, a.location);
			coh.normalize();
			coh.limit(maxAcc);
			coh.mult(cohWeight);
			a.addAcceleration(coh); 
		}
	}

	/*
	 * Align flock elements with each other
	 */
	void alignment() {
		 for (int i = 0; i < birds.size(); ++i) {
			Bird a = birds.get(i);
			PVector avVelocity = a.velocity.copy();
			for (int j = 0; j < birds.size(); ++j) {
				Bird b = birds.get(j);
				
				if (a != b) {
					float dist = PVector.dist(a.location, b.location);
					if (dist < aliArea) {
						avVelocity.add(b.velocity);
					}
				}
			} 

			avVelocity.normalize();
			avVelocity.limit(maxAcc);
			avVelocity.mult(aliWeight);
			a.addAcceleration(avVelocity);
		} 
	}
}
/*
 * Class for enemy obstacles
 */
public class Obstacle {
	PVector projectileLocation;
	PVector obstaclePosition;
	PVector obstacleSize;
	boolean exists;
	PImage treasure;
	ArrayList<Obstacle> obstacleArray;
	int obstacleIndex;

	/*
	 * Initialize all variable and load image
	 * @constructor
	 * @param {PVector} position - Position for obstacle
	 * @param {int} obstacleIndexOriginal - Unique index for item in array list
	 * @param {ArrayList<Obstacle>} obstacleArrayOriginal - Reference array list
	 */
	public Obstacle(PVector position, int obstacleIndexOriginal, ArrayList<Obstacle> obstacleArrayOriginal) {
		projectileLocation = new PVector(0, 0);
		obstacleArray = obstacleArrayOriginal;
		treasure = loadImage("treasure.png");
		treasure.resize(100, 100);
		obstacleIndex = obstacleIndexOriginal;
		obstaclePosition = position;
		obstacleSize = new PVector(100, 100);
		exists = true;
	}

	/*
	 * Destory this obstacle
	 */
	void destroy() {
		for (int i = 0; i < obstacleArray.size(); i++) {
			if (obstacleArray.get(i).obstacleIndex == obstacleIndex) {
				obstacleArray.remove(i);
			}
		}
	}

	/*
	 * Display this obstacle in the draw() function
	 */
	void display(PVector location) {
		if (!exists)
		return;
		projectileLocation = location;
		image(treasure, obstaclePosition.x, obstaclePosition.y);
		// Check for collisions
		if (
			projectileLocation.x > obstaclePosition.x && projectileLocation.x < (obstaclePosition.x + obstacleSize.x) &&
			projectileLocation.y > obstaclePosition.y && projectileLocation.y < (obstaclePosition.y + obstacleSize.y)
		) {
			this.destroy();
		}
	}

}


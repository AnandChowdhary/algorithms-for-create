public class Obstacle {
	PVector projectileLocation;
	PVector obstaclePosition;
	PVector obstacleSize;
	boolean exists;
	PImage treasure;
	ArrayList<Obstacle> obstacleArray;
	int obstacleIndex;

	public Obstacle(PVector position, int obstacleIndexX, ArrayList<Obstacle> obstacleArrayX) {
		projectileLocation = new PVector(0, 0);
		obstacleArray = obstacleArrayX;
		treasure = loadImage("treasure.png");
		treasure.resize(100, 100);
		obstacleIndex = obstacleIndexX;
		obstaclePosition = position;
		obstacleSize = new PVector(100, 100);
		exists = true;
	}

	void destroy() {
		for (int i = 0; i < obstacleArray.size(); i++) {
			if (obstacleArray.get(i).obstacleIndex == obstacleIndex) {
				obstacleArray.remove(i);
			}
		}
	}

	void display(PVector location) {
		if (!exists)
		return;
		projectileLocation = location;
		image(treasure, obstaclePosition.x, obstaclePosition.y);
		if (projectileLocation.x > obstaclePosition.x && projectileLocation.x < (obstaclePosition.x + obstacleSize.x) && projectileLocation.y > obstaclePosition.y && projectileLocation.y < (obstaclePosition.y + obstacleSize.y)) {
			this.destroy();
		}
	}

}


/*
 * ANGRY FISH
 * Algorithms for CreaTe
 * Creative Technology module 4
 * Author: Couwenbergh, Wouter and Chowdhary, Anand
 * License: CC-BY 4.0
 */

int level;
int fps;
int endMillis;
boolean playing;
int realWorldCorrection;
int radius;
float airResistance;
float bounceResistance;
float frameTime;
float resetPace;
float screenOffset;
boolean started;
float projectileScreenPos;
boolean aim;
boolean fired;
PVector gravity;
PVector startLocation;
PImage catpult;
PImage fish;
PImage fish2;
PImage fish3;
PImage fish4;
PImage bird;
PImage introScreen;
PImage gameOverScreen;
Flock f;
Catapult c;
Background b;
ArrayList<Projectile> proj = new ArrayList<Projectile>();
ArrayList<Projectile> reserve = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

void setup() {
	playing = false;
	level = 0;
	size(1366, 768, P2D);
	setStuff();
	frameRate(fps);
}

void initializeLevel() {
	for (int i = obstacles.size() - 1; i >= 0; i--) obstacles.remove(i);
	for (int i = 0; i < level; i++) {
		obstacles.add(new Obstacle(new PVector(random(1000, 4000), random(400, 600)), obstacles.size(), obstacles));
	}
}

void draw() {
	int frameStart = millis();
	frameTime = 1000/fps;
	
	if (!playing) {
		if (started) {
			image(gameOverScreen, width / 2, height / 2);
		} else {
			image(introScreen, 0, 0);
		}
	} else {
		translate(screenOffset, 0);
		if (!(frameStart > endMillis + frameTime && frameStart < (endMillis + frameTime + 2))) {
			frameTime = frameTime + (frameStart - endMillis - frameTime);
		}
		display();
		update();
		endMillis = millis();
		fill(0);
		textSize(32); 
		text("Level " + level, 20, 40);
	}
}

void setStuff() {
	level = 1;
	fps = 60;
	endMillis = 0;
	realWorldCorrection = 100;
	radius = 10;
	airResistance = 0.99;
	started = false;
	bounceResistance = 0.75;
	frameTime = 1000/fps;
	resetPace = 80;
	screenOffset = 0;
	aim = false;
	fired = false;
	gravity = new PVector(0, -9.81);
	startLocation = new PVector(width/4, 3*height/5);
	projectileScreenPos = width - startLocation.x;
	catpult = loadImage("catapult.png");
	fish = loadImage("fish.png");
	fish2 = loadImage("fish2.png");
	fish3 = loadImage("fish3.png");
	fish4 = loadImage("fish4.png");
	bird = loadImage("bird.png");
	introScreen = loadImage("coverimage.png");
	gameOverScreen = loadImage("over.png");
	c = new Catapult();
	b = new Background();
	f = new Flock(100);
	fillReserve();
	initializeLevel();
}

void fillReserve() {
	for (int i = reserve.size() - 1; i >= 0; i--) reserve.remove(i);
	reserve.add(new Orange());
	reserve.add(new Yellow());
	reserve.add(new Blue());
	reserve.add(new Cyan());
	arangeReserve();
}

void arangeReserve() {
	for (int i = 0; i < reserve.size(); i++) {
		reserve.get(i).location = new PVector(startLocation.x - (i+1)*6*radius, height - 1.5*radius);
	}
}

void update() {
	frameTime = frameTime/realWorldCorrection;
	for (int i = 0; i < proj.size(); ++i) {
		proj.get(i).update();
		if (proj.get(i).done) {
			proj.remove(i);
			fired = false;
			if (obstacles.size() == 0) nextLevel();
			if (reserve.size() == 0) {
				level = 0;
				translate(0, 0);
				initializeLevel();
				playing = false;
			}
		}
	}
	if (fired) {
		if (proj.get(0).location.x > projectileScreenPos) {
			screenOffset = -(proj.get(0).location.x - projectileScreenPos);
		}
	} else {
		if (screenOffset < -resetPace) {
			screenOffset += resetPace;
		} else {
			screenOffset = 0;
		}
	}
	if (mousePressed) {
		if (proj.size() > 0) {
			if (!fired && !proj.get(0).active) {
				proj.get(0).location = new PVector(mouseX, mouseY);
				PVector angle = PVector.sub(startLocation, new PVector(mouseX, mouseY));
				proj.get(0).theta = angle.heading2D();
			}
		}
	}
	f.update();
}

void display() {
	b.display();
	for (int i = 0; i < proj.size(); ++i) {
		proj.get(i).display();
	}
	for (int i = 0; i < reserve.size(); i++) {
		reserve.get(i).display();
	}
	c.display();
	f.display();
	for (int i = 0; i < obstacles.size(); i++) {
		try {
			obstacles.get(i).display(proj.get(0).location);
		} 
		catch (Exception e) {
			obstacles.get(i).display(new PVector(0, 0));
		}
	}
}

void nextLevel() {
	level++;
	initializeLevel();
	fillReserve();
	proj.add(reserve.get(0));
	reserve.remove(0);
	proj.get(0).location = startLocation.copy();
	arangeReserve();
}

void mousePressed() {
	if (!playing) {
		playing = true;
		started = true;
	} else if (!fired) {
		aim = true;
		if (reserve.size() > 0 && proj.size() < 1) {
			proj.add(reserve.get(0));
			reserve.remove(0);
			proj.get(0).location = new PVector(mouseX, mouseY);
			arangeReserve();
		} else if (reserve.size() > 0) {
			proj.get(0).location = new PVector(mouseX, mouseY);
		} else {
			nextLevel();
		}
	}
}

void mouseReleased() {
	if (!fired) {
		if (proj.size() > 0) {
			proj.get(0).location = startLocation.copy();
			proj.get(0).acceleration = PVector.sub(startLocation, new PVector(mouseX, mouseY));
			proj.get(0).active = true;
			aim = false;
			fired = true;
		}
	}
}

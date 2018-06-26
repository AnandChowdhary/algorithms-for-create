// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

PImage bird;
Flock flock;
Dog doggie;

void setup() 
{
    size(2000,1500);
    //fullScreen(FX2D);
    bird = loadImage("bird.png");
    imageMode(CENTER);
    flock = new Flock();
    doggie = new Dog();
    // Add an initial set of boids into the system
    for (int i = 0; i < 100; i++) 
    {
        Boid b = new Boid(width/2,height/2);
        flock.addBoid(b);
    }
}

void draw() 
{
    background(255);
    //image(bird,width/2,height/2,40,40);
    flock.run();
    doggie.run(mouseX,mouseY);
    // Instructions
    fill(0);
    text("Drag the mouse to generate new boids.",10,height-16);
}

// Add a new boid into the System
void mouseDragged() 
{
    flock.addBoid(new Boid(mouseX,mouseY));
}
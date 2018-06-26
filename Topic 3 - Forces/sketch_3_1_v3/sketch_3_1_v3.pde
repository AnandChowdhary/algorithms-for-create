/*
  Has a ball that moves like it is being shot out of a catapult/slingshot.
  the movement is dependend on millis, framerate should thus not affect the
  trajectory of the projectile.
  made by Wouter Couwenbergh
  June 2018
*/

int radius;
PVector gravity;
float airResistance;
float bounceResistance;
PVector location;
PVector velocity;
PVector acceleration;
float deceleration;
boolean start = false;
int endMillis = 0;
int fps = 60;
float frameTime;

void setup() 
{
    size(2000,1000);
    frameRate(fps);
    //setting all the variables
    radius = 10;
    gravity = new PVector(0,9.81);
    airResistance = 0.99;
    bounceResistance = 0.7;
    location = new PVector(radius/2,3*height/4);
    velocity = new PVector(0,0);
    acceleration = new PVector(120,-150);
    deceleration = 0.8;
    frameTime = 1000/fps;
}

void draw() 
{
    //gets the time at the beginning of the frame
    int frameStart = millis();
    //sets the value for how long the frame should take
    frameTime = 1000/fps;
    background(255);
    if (start)
    {
        //checks if the previous frame ran long or not, if it did it adds more time to the frameTime
        //to correct for this.
        if (!(frameStart > endMillis + frameTime && frameStart < (endMillis + frameTime + 2)))
        {
          frameTime = frameTime + (frameStart - endMillis - frameTime);
        }
        move();
    }
    fill(255,0,0);
    ellipse(location.x, location.y, radius, radius);

    endMillis = millis();
}

void move()
{
    //corrects the simulation in relation to the real world
    frameTime = frameTime/100;
    //keeps the projectile within the sketch
    if (location.x >= width - radius/2)
    {
        velocity.x = -bounceResistance * velocity.x;
        location.x = width - radius/2;
    }
    if (location.x <= radius/2)
    {
        velocity.x = -bounceResistance * velocity.x;
        location.x = radius/2;
    }
    if (location.y >= height - radius/2)
    {
        velocity.y = -bounceResistance * velocity.y;
        location.y = height - radius/2;
    }
    if (location.y <= radius/2)
    {
        velocity.y = -bounceResistance * velocity.y;
        location.y = radius/2;
    }
    //checks if the force of the catapult should still be applied
    if (acceleration.mag() > 1)
    {
        velocity.add(PVector.mult(acceleration,frameTime));
        acceleration.mult(deceleration);
    }
    //adds gravity, velocity and resistance
    location.add(PVector.mult(velocity,frameTime));
    velocity.add(PVector.mult(gravity,frameTime));
    velocity.mult(airResistance);
}

void mouseClicked()
{
    //starts the sketch
    if (!start)
    {
        start = true;
        endMillis = millis();
    }
}
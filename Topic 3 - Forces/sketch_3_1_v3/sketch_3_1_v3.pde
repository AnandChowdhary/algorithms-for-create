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
    int frameStart = millis();
    frameTime = 1000/fps;
    background(255);
    if (start)
    {
        if (millis() > endMillis + frameTime && millis() < (endMillis + frameTime + 2))
        {
            move();
        }
        else
        {
            frameTime = frameTime + (millis() - endMillis - frameTime);
            move();
        }
    }
    fill(255,0,0);
    ellipse(location.x, location.y, radius, radius);

    endMillis = millis();
}

void move()
{
    frameTime = frameTime/100;
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
    if (acceleration.mag() > 1)
    {
        velocity.add(PVector.mult(acceleration,frameTime));
        acceleration.mult(deceleration);
    }
    location.add(PVector.mult(velocity,frameTime));
    velocity.add(PVector.mult(gravity,frameTime));
    velocity.mult(airResistance);
}

void mouseClicked()
{
    if (!start)
    {
        start = true;
        endMillis = millis();
    }
}
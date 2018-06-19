int radius;
PVector gravity;
float airResistance;
float bounceResistance;
PVector location;
PVector velocity;
PVector acceleration;
float deceleration;
boolean active = false;
boolean done = false;
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
    bounceResistance = 0.75;
    location = new PVector(width/4,3*height/5);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    deceleration = 0.8;
    frameTime = 1000/fps;

}

void draw() 
{
    int frameStart = millis();
    frameTime = 1000/fps;
    background(255);
    fill(255,0,0);
    stroke(255,0,0);
    if (active)
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
    if (!active)
    line(mouseX,mouseY,location.x,location.y);
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
    
    if (velocity.y < 0.2 && location.y > (height - radius))
    {
        velocity.y = 0;
        if (velocity.x < 0.02 && location.y > (height - radius))
        {
            velocity.x = 0;
            location.y = height - radius/2;
            done = true;
        }
    }
    
}

void mouseClicked()
{
    if (!active)
    {
        active = true;
        done = false;
        acceleration = PVector.sub(location, new PVector(mouseX,mouseY));
        endMillis = millis();
    }
}

void keyPressed()
{
    if (key == 'r' || key == 'R')
    {
        if (done)
        {
            active = false;
            location = new PVector(width/4,3*height/5);
        }
    }
}
int radius;
PVector gravity;
float airResistance;
float bounceResistance;
PVector location;
PVector velocity;
PVector acceleration;
float deceleration;
boolean start = false;

void setup() 
{
    size(2000,1000);
    radius = 10;
    gravity = new PVector(0,0.2);
    airResistance = 0.99;
    bounceResistance = 0.5;
    location = new PVector(radius/2,3*height/4);
    velocity = new PVector(0,0);
    acceleration = new PVector(10,-10);
    deceleration = 0.5;

}

void draw() 
{
    background(255);
    if (start)
    {
        move();
    }
    fill(255,0,0);
    ellipse(location.x, location.y, radius, radius);
}

void move()
{
    
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
        velocity.add(acceleration);
        acceleration.mult(deceleration);
    }
    location.add(velocity);
    velocity.add(gravity);
    velocity.mult(airResistance);
}

void mouseClicked()
{
    if (!start)
    {
        start = true;
    }
}
int radius;
PVector gravity;
float airResistance;
float bounceResistance;
PVector location;
PVector velocity;
PVector acceleration;
float deceleration;
boolean start = false;
boolean active = false;
boolean done = false;

void setup() 
{
    size(2000,1000);
    radius = 10;
    gravity = new PVector(0,0.2);
    airResistance = 0.99;
    bounceResistance = 0.75;
    location = new PVector(width/4,3*height/5);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    deceleration = 0.5;

}

void draw() 
{
    background(255);
    fill(255,0,0);
    stroke(255,0,0);
    if (active)
        move();
    if (!active)
        line(mouseX,mouseY,location.x,location.y);
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
        println(acceleration.mag());
    }
    location.add(velocity);
    velocity.add(gravity);
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
        println(acceleration);
        acceleration = acceleration.mult(0.05);
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
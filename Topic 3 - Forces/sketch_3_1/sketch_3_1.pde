int radius;
PVector gravity;
float airResistance;
float bounceResistance;
PVector location;
PVector velocity;

void setup() 
{
    size(2000,1000);
    radius = 10;
    gravity = new PVector(0,0.2);
    airResistance = 0.99;
    bounceResistance = 0.5;
    location = new PVector(radius/2,3*height/4);
    velocity = new PVector(15,-20);

}

void draw() 
{
    background(255);
    move();
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
    location.add(velocity);
    velocity.add(gravity);
    velocity.mult(airResistance);
}
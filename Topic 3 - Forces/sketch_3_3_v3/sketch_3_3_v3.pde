/*
  Makes a ball move along a parabollic arc
  made by Wouter Couwenbergh
  June 2018
*/

ArrayList<PVector> parabolaPoints = new ArrayList<PVector>();
PVector location;
PVector velocity;
float gravity;
float friction;
int radius = 10;
float beginHeight;
int xAxis = -1;
int offSet;
boolean switched = true;

void setup()
{
    size(1500,1500);
    background(0);
    stroke(255);
    fillParabolaPoints();
    beginHeight = height-radius;
    offSet = radius/2;
    velocity = new PVector(0,0);
    gravity = 0.1;
    friction = 0.999;
    location = new PVector(xAxis * sqrt(beginHeight/(2.5/(width/2))),beginHeight);
}

void draw()
{
    background(0);
    translate(width/2,height-2*offSet);
    scale(1, -1);
    ellipse(location.x, location.y, radius, radius);
    move();
    for (int i = 0; i < parabolaPoints.size(); i++)
    {
        point(parabolaPoints.get(i).x,parabolaPoints.get(i).y);
    }
}

void fillParabolaPoints()
{
    for(float x = -width/2; x < width/2; x++)
    {
        float y = (2.5/(width/2))*x*x;
        if (y <= height)
        {
            parabolaPoints.add(new PVector(x,y));
        }
        //point(x,y);
    }
}

void move()
{   
    float slope = 10*location.x/width;
    PVector normalForce = new PVector(1,slope);
    normalForce.normalize();
    normalForce.rotate(radians(-90));
    
    float lengthNormalForce = 1/pow(normalForce.mag(),2); //length 1 because of normalize, just to be sure

    PVector gravityPV = new PVector(0,gravity);

    float dotProduct = normalForce.dot(gravityPV);

    float scalar = dotProduct * lengthNormalForce;

    normalForce = PVector.mult(normalForce,scalar);

    PVector acceleration = gravityPV.sub(normalForce);

    velocity = velocity.add(acceleration);
    velocity.mult(friction);

    float angleBetween;
    
    //moving left to right uphill
    if (degrees(PVector.angleBetween(normalForce, new PVector(1,0))) > 90 && !switched)
    {
        if (velocity.mag() < 0.05 || velocity.x > 0)
        {
            switched = true;
        }
        angleBetween = PVector.angleBetween(velocity,acceleration.mult(-1));
        velocity.rotate(angleBetween);
    }
    
    //moving right left downhill
    else if (degrees(PVector.angleBetween(normalForce, new PVector(1,0))) > 90)
    {
        angleBetween = PVector.angleBetween(velocity,acceleration.mult(-1));
        velocity.rotate(angleBetween);
        velocity.mult(-1);
    }
    
    //moving right left uphill
    else if (switched)
    {
        angleBetween = PVector.angleBetween(velocity,acceleration);
        velocity.rotate(angleBetween);
        velocity.mult(-1);
        if (velocity.mag() < 0.05 || velocity.x < 0)
        {
            switched = false;
        }
    }
    
    //moving left to right downhill
    else
    {
        angleBetween = PVector.angleBetween(velocity,acceleration);
        velocity.rotate(angleBetween);
    }

    location = location.sub(velocity);
    location = new PVector(location.x, (2.5/(width/2))*pow(location.x,2));
}
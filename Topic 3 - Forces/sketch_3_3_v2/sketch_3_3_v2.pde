ArrayList<PVector> parabolaPoints = new ArrayList<PVector>();
PVector location;
float velocity;
float gravity;
float friction;
int radius = 10;
float beginHeight;
int xAxis = -1;
int offSet;
boolean switched = false;

void setup()
{
    size(1500,1500);
    background(0);
    stroke(255);
    fillParabolaPoints();
    beginHeight = height-radius;
    offSet = radius/2;
    velocity = 5;
    gravity = 0.05;
    friction = 0.999;
    location = new PVector(xAxis * sqrt(beginHeight/(2.5/(width/2))),beginHeight);
}

void draw()
{
    background(0);
    translate(width/2,height-offSet);
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
    float posY = location.y - velocity;
    if (posY < 0)
    {
        posY = 0;
        velocity = -velocity;
        xAxis = -xAxis;
    }
    velocity = velocity * friction;
    velocity += gravity;
    location = new PVector(xAxis * sqrt(posY/(2.5/(width/2))),posY);
}

void mousePressed()
{
    move();
}
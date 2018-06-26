ArrayList<PVector> parabolaPoints = new ArrayList<PVector>();
PVector location;
PVector velocity;
int radius = 10;
float beginHeight;
int counter = 0;
int xAxis = -1;
int offSet;
int counterSteps = 1;
boolean switched = false;

void setup()
{
    size(1500,1500);
    background(0);
    stroke(255);
    fillParabolaPoints();
    beginHeight = height-radius;
    offSet = radius/2;
    location = new PVector(xAxis * sqrt(beginHeight/(2.5/(width/2))),beginHeight);
}

void draw()
{
    background(0);
    translate(width/2,height);
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
    for(float x = -width/2; x < width/2; x+=10)
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
    if (counter > parabolaPoints.size()-1)
    {
        counter = parabolaPoints.size() - 1;
        counterSteps = -counterSteps;
    }
    if (counter <= 0)
    {
        counter = 0;
        counterSteps = -counterSteps;
    }
    if (counter >= parabolaPoints.size()/2 && !switched)
    {
        xAxis = -xAxis;
        offSet = -offSet;
        switched = true;
    }
    if (counter <= parabolaPoints.size()/2 && switched)
    {
        xAxis = -xAxis;
        offSet = -offSet;
        switched = false;
    }
    float parabolaHeight = parabolaPoints.get(counter).y;
    location = new PVector(xAxis * sqrt(parabolaHeight/(2.5/(width/2))),parabolaHeight);
    
    counter ++;
}

void mousePressed()
{
    move();
}
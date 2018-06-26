/*
  Birds that fly around using flocking, with a dog which they avoid.
  made by Wouter Couwenbergh
  June 2018
*/

Stem[] stalks;
ArrayList<Wind> winds = new ArrayList<Wind>();
float dist = 40;
int nrStalksRow;
int distRows = 40;
int rows = 30;
int sizeStalks = 100;
int stalkSegments = 15;

void setup() 
{
    size(1000,1000,FX2D);
    nrStalksRow = int(width/dist);
    rows = int((height-sizeStalks)/distRows);
    stalks = new Stem[rows*nrStalksRow];
    println(stalks.length);
    fillArray();
}

void draw() 
{
    background(255);
    strokeWeight(2);
    stroke(#58CE3E);
    for (int i = 0; i < stalks.length; i++)
    {
        stalks[i].run();      
    }
    if (mousePressed)
    {
        //add a new wind
        winds.add(new Wind(0.0001,50));
    }
    
    //go through all the winds and update
    for (int i = 0; i < winds.size(); i++)
    {
        winds.get(i).run();
        if (winds.get(i).done)
        {
            winds.remove(i);
        }
    }
}

//fill the array with stalks
void fillArray()
{
    float x = dist/2;
    float y = 0;
    int index = 0;
    float xOffset = 0;
    
    //add stalks for a row
    for (int i = 0; i < rows; i++)
    {
        //fill a row with x nr of stalks
        for (int j = 0; j < nrStalksRow; j++)
        {
            stalks[index] = new Stem(x,y,sizeStalks,stalkSegments);
            x += dist;
            index += 1;
        }
        y += distRows;
        xOffset += 5;
        if (xOffset == dist-5)
        {
            xOffset = 0;
        }
        x = dist/2+xOffset;
    }
}
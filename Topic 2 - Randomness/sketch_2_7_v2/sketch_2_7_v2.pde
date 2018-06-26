/*
  Makes a landschape using two-dimensional Perlin noise.
  made by Wouter Couwenbergh
  June 2018
*/

float increment = 0.02;
int rows;
int columns;
int scale = 10;
int elevation = 100;
float zoff;
float zIncrement;


void setup() 
{
    size(1000,1000,P3D);
    rows = height/scale;
    columns = width/scale;
    zoff = 0;
    zIncrement  = 0.03;
    //noLoop();
}

void draw() 
{
    background(255);
    //rotates the plane backwards
    rotateX(PI/4);
    
    float yoff = 0;
    //cycles through the y points
    for (int i = 0; i < rows; i++) 
    {
        yoff +=increment;
        //start a triangle strip for this row
        beginShape(TRIANGLE_STRIP);
        float xoff = 0;
        //cycles through the x points
        for (int j = 0; j < columns; j++) 
        {
            //adds two points for the triangle strip
            xoff += increment;
            float z = noise(xoff*scale,yoff*scale,zoff)*elevation;
            vertex(j*scale,i*scale,z);
            float yoff2 = yoff + increment;
            float z2 = noise(xoff*scale,yoff2*scale,zoff)*elevation;
            vertex(j*scale,(i+1)*scale,z2);
        }
        endShape();
    }
    
    //changes the third variable of the noise to make the landscape change
    zoff += zIncrement;

    /*
    for (int i = 0; i < width/2; i+=10) 
    {
        line(i,0,i,height/2);
    }

    for (int i = 0; i < height/2; i+=10) 
    {
        line(0,i,width/2,i);
    }
    */
}
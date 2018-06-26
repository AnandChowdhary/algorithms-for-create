float increment = 0.02;
int rows;
int columns;
int scale = 10;
int elevation = 100;


void setup() 
{
    size(1000,1000,P3D);
    rows = height/scale;
    columns = width/scale;
    noLoop();
}

void draw() 
{
    background(255);
    rotateX(PI/4);
    float yoff = 0;
    for (int i = 0; i < rows; i++) 
    {
        yoff +=increment;
        beginShape(TRIANGLE_STRIP);
        float xoff = 0;
        for (int j = 0; j < columns; j++) 
        {
            xoff += increment;
            float z = noise(xoff*scale,yoff*scale)*elevation;
            vertex(j*scale,i*scale,z);
            float yoff2 = yoff + increment;
            float z2 = noise(xoff*scale,yoff2*scale)*elevation;
            vertex(j*scale,(i+1)*scale,z2);
        }
        endShape();
    }

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
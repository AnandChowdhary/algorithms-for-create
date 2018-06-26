float xoff;
float xincrement; 
float yoff;
float yincrement; 
int counter = 0;

void setup() 
{
    size(1000,1000);
    xoff = random(0,1);
    xincrement = random(0.005,0.01);
    yoff = random(0,1);
    yincrement = random(0.005,0.01);
    background(255);
}

void draw() 
{
    //background(255);
    noStroke();
    if (counter > 3)
    {
        fill(255,75);
        rect(0,0,width,height);
        counter = 0;
    }

    float n = noise(xoff)*2;
    float m = noise(yoff)*2;
    float l = m;

    m = constrain(m, 0.2, 1.5);
    l = 2/(3*map(l,0,2,0.5,1));
    

    fill(l*255,0,0);

    beginShape();
    vertex(width/2,height);
    bezierVertex(width/8, height, width/3, height/3,n*width/2, m*height/4);
    bezierVertex(2*width/3, height/3, 7*width/8, height, width/2, height);
    endShape();

    xoff += xincrement;
    yoff += yincrement;
    xincrement = random(0.005,0.01);
    yincrement = random(0.005,0.01);
    counter++;
}
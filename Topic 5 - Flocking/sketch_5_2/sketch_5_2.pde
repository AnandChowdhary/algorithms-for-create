PImage bird;
Flock f;
Bird b;

void setup() 
{
    size(2000,1500);    
    bird = loadImage("bird.png");
    imageMode(CENTER);
    f = new Flock(100);
}

void draw() 
{
    background(255);
    f.run();
}
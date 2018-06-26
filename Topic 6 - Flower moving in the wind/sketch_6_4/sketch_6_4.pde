MSD a;

void setup()
{
    size(2000,1000);
    float yPos = height - height/4;;
    float mass = 5;
    float spring = 0.2;
    float damper = 0.2;
    float force = 100;
    float size = 25;
    a = new MSD(width/2,yPos,mass,spring,damper,force,size);
}

void draw()
{
    background(255);
    a.run();
}
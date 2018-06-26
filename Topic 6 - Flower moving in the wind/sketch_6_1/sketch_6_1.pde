MassSpringDamper a;

void setup() 
{
    size(1000,1000);
    a = new MassSpringDamper();
}

void draw() 
{
    background(255);
    a.run();    
}
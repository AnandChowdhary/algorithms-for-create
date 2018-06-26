Stem s;
boolean active = true;
void setup() 
{
    size(1000,1000);
    s = new Stem();
    
}

void draw() 
{
    if (active)
    { 
        background(255);
        s.run();      
    }
}

void mousePressed()
{
  active = !active; 
}
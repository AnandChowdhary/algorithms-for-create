ArrayList<Flame> flame = new ArrayList<Flame>();
float scale;
float x;
float xoff;
float xincrement; 

void setup() 
{
    size(2000,800,FX2D);
    scale = 0.15;
}

void draw() 
{
    background(0);
    x = noise(xoff) - 0.5;
    flame.add(new Flame());
    scale(scale,-scale);
    translate((width/2)/scale,-height/scale);
    for (int i = 0; i < flame.size(); i++)
    {
        flame.get(i).display();
        if (flame.get(i).check())
        {
            flame.remove(i);
        }
    }
    
    xoff += xincrement;
    xincrement = random(0.00001,0.0005);
    if (frameCount % 360 == 0)
    {
        xoff = random(-5,5);
    }
}
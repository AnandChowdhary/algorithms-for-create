Water surface;

void setup()
{
    size(2000,1000);
    surface = new Water();
}

void draw()
{
    background(255);
    surface.display();
}
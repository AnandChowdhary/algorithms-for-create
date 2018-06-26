//one of the dots being placed on the screen

public class Dots 
{
    PVector location;
    int radius;
    color f;

    public Dots (PVector l, int r, color c) 
    {
        location = l;
        radius = r;
        f = c;
    }

    void display()
    {
        fill(f);
        ellipse(location.x, location.y, radius, radius);
    }
}
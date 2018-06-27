//a raindrop that will fall from the sky and affect the water surface

class Raindrop
{
    PVector location;
    float velocity;
    float acceleration;
    float size;
    int index;
    
    public Raindrop()
    {
        //get the resolution of the water surface
        int nr = surface.getNr();
        //pick a random number which is within the max nr of water resolution
        index = int(random(0,nr));
        //convert the index to the apropriate x location
        int x = int(index*surface.size + size/2);
        location = new PVector(x,0);
        velocity = 0;
        acceleration = 0.1;
        size = 10;
    }
    
    void run()
    {
        update();
        display();
    }
    
    void display()
    {
        ellipse(location.x,location.y,size,size);
    }
    
    void update()
    {
        location.y += velocity;
        velocity += acceleration;
    }
}
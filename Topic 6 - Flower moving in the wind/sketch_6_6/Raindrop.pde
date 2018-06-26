class Raindrop
{
    PVector location;
    float velocity;
    float acceleration;
    float size;
    int index;
    
    public Raindrop()
    {
        int nr = surface.getNr();
        index = int(random(0,nr));
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
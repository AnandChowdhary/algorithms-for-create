public class Particle 
{
    PVector location;
    PVector velocity;
    PVector acceleration;
    float alpha = 1.0;
    float decay;
    float radius;

    public Particle (PVector l, PVector v) 
    {
        location = new PVector(l.x,l.y);
        velocity = new PVector(v.x,v.y);
        velocity.rotate(radians(180));
        float angle = random(-40,40);
        velocity.rotate(radians(angle));
        decay = random(0.8,0.99);
        radius = random(8,17);
    }

    void run()
    {
        move();
        display();
    }
    
    

    void move()
    {
        location.add(velocity);
        alpha = alpha * decay;
    }

    void display()
    {

    }

    boolean remove()
    {
        
        if (alpha < 0.1)
        {
            return true;
        }
        else 
        {
            return false;
        }
        
    }
}
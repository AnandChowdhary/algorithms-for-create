public class Particle 
{
    PVector location;
    PVector velocity;
    PVector acceleration;
    float alpha = 1.0;
    float decay;
    int r;
    float radius;

    public Particle (PVector l) 
    {
        location = new PVector(l.x,l.y);
        velocity = new PVector(random(-10,-5),random(-10,10));
        acceleration = new PVector(-0.1,0);
        decay = random(0.8,0.99);
        r = int(random(150,255));
        radius = random(4,8);
    }
    
    void run()
    {
         move();
         display();
    }
    
    void move()
    {
        location.add(velocity);
        velocity.add(acceleration);
        alpha = alpha * decay;
    }

    void display()
    {
        noStroke();
        fill(r,0,0,int(alpha * 255));
        ellipse(location.x, location.y, radius, radius);
    }

    //if the alpha value of the fill is too low, the particle can be removed.
    //also if it has moved of screen it can be removed.
    boolean remove()
    {
        if (alpha < 0.1 || location.x > width || location.x < 0 || location.y > height || location.y < 0)
        {
            return true;
        }
        else 
        {
            return false;
        }
    }
}
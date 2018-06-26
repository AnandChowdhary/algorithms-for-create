public class Particle 
{
    PVector location;
    PVector velocity;
    PVector acceleration;
    float alpha = 1.0;
    float decay;
    int r;
    float radius;
    int shape;

    public Particle (PVector l) 
    {
        location = new PVector(l.x,l.y);
        velocity = new PVector(random(-10,10),random(-10,10));
        setAcceleration();
        decay = random(0.8,0.99);
        r = int(random(150,255));
        radius = random(8,17);
        shape = int(random(0,4));
    }
    
    void setAcceleration()
    {
        int accX = 1;
        int accY = 1;
        if (velocity.x < 0)
        {
            accX = -1;
        }
        if (velocity.y < 0)
        {
            accY = -1;
        }
        acceleration = new PVector(accX*random(0.05,0.1),accY*random(0.05,0.1));
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
        PVector temploc = new PVector(location.x,location.y);
        temploc.rotate(-radians(45));
        //chooses a shape depending on what random number the int has gotten
        switch (shape) 
        {
            case 0 :
                ellipse(location.x, location.y, radius, radius);
            break;	 
            case 1 :
                rectMode(CENTER);
                rect(location.x, location.y, radius, radius);
            break;	 
            case 2 :
                rectMode(CENTER);
                rect(location.x, location.y, radius, radius);
                pushMatrix();
                rotate(radians(45));
                translate(temploc.x,temploc.y);
                rect(0, 0, radius, radius);
                popMatrix();
            break;	 
            case 3 :
                pushMatrix();
                rotate(radians(45));
                translate(temploc.x,temploc.y);
                rect(0, 0, radius, radius);
                popMatrix();
            break;	   
            default :
                ellipse(location.x, location.y, radius, radius);
            break;	
        }
    }

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
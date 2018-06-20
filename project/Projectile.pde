public class Projectile 
{
    PVector location;
    PVector velocity;
    PVector acceleration;
    float deceleration;
    boolean done = false;
    boolean active = false;
    float decFricCorrection;

    public Projectile () 
    {
        location = startLocation.copy();
        velocity = new PVector(0, 0);
        acceleration = new PVector(0,0);
        deceleration = 0.8;
        decFricCorrection = 1000;
        decFricCorrection = decFricCorrection/fps;
        decFricCorrection = decFricCorrection/realWorldCorrection;
    }

    void display()
    {
        if (active)
        {
            noStroke();
            ellipse(location.x, location.y, radius, radius);
        }
    }
    void move()
    {
        if (active)
        {
            if (location.y >= height - radius/2)
            {
                velocity.y = -bounceResistance * velocity.y;
                location.y = height - radius/2;
            }
            if (acceleration.mag() > 1)
            {
                velocity.add(PVector.mult(acceleration, frameTime));
                acceleration.mult(pow(deceleration,frameTime/decFricCorrection));
            }
            location.add(PVector.mult(velocity, frameTime));
            velocity.add(PVector.mult(gravity, frameTime));
            velocity.mult(pow(airResistance,frameTime/decFricCorrection));
            if (abs(velocity.y) < 2 && location.y > (height - radius))
            {
                velocity.y = 0;
                location.y = height - radius/2;
                if (abs(velocity.x) < 2)
                {
                    velocity.x = 0;
                    done = true;
                }
            }
        }
    }   
}

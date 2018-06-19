public class Projectile 
{
    PVector location;
    PVector velocity;
    PVector acceleration;
    float deceleration;
    boolean done = false;
    boolean active = false;

    public Projectile () 
    {
        location = startLocation.copy();
        velocity = new PVector(0, 0);
        acceleration = new PVector(0,0);
        deceleration = 0.8;
    }

    void display()
    {
        if (!active)
        {
            noStroke();
            ellipse(mouseX,mouseY, radius, radius);
        }
        else
        {
            noStroke();
            ellipse(location.x, location.y, radius, radius);
        }
    }
    void move()
    {
        if (active)
        {
            frameTime = frameTime/100;
            if (location.x >= width - radius/2)
            {
                velocity.x = -bounceResistance * velocity.x;
                location.x = width - radius/2;
            }
            if (location.x <= radius/2)
            {
                velocity.x = -bounceResistance * velocity.x;
                location.x = radius/2;
            }
            if (location.y >= height - radius/2)
            {
                velocity.y = -bounceResistance * velocity.y;
                location.y = height - radius/2;
            }
            if (location.y <= radius/2)
            {
                velocity.y = -bounceResistance * velocity.y;
                location.y = radius/2;
            }
            if (acceleration.mag() > 1)
            {
                velocity.add(PVector.mult(acceleration, frameTime));
                acceleration.mult(deceleration);
            }
            location.add(PVector.mult(velocity, frameTime));
            velocity.add(PVector.mult(gravity, frameTime));
            velocity.mult(airResistance);

            if (velocity.y < 0.2 && location.y > (height - radius))
            {
                velocity.y = 0;
                if (velocity.x < 0.02 && location.y > (height - radius))
                {
                    velocity.x = 0;
                    location.y = height - radius/2;
                    done = true;
                }
            }
        }
    }   
}

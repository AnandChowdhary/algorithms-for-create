public class Bird 
{
    PVector location;
    PVector velocity;
    PVector acceleration;
    float size = 40;
    float maxSpeed = 5;

    public Bird (float x, float y, float dx, float dy) 
    {
        location = new PVector(x,y);
        velocity = new PVector(dx,dy);
        acceleration = new PVector(0,0);
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
        acceleration = new PVector(0,0);
        if (location.x < size/2)
        {
            velocity.x = -velocity.x;
            location.x = size/2;
        }
        if (location.x > width-size/2)
        {
            velocity.x = -velocity.x;   
            location.x = width-size/2;
        }
        if (location.y < size/2)
        {
            velocity.y = -velocity.y;
            location.y = size/2;
        }
        if (location.y > height-size/2)
        {
            velocity.y = -velocity.y;
            location.y = height-size/2;
        }
        if (velocity.mag() > maxSpeed)
        {
            velocity.normalize();
            velocity.mult(maxSpeed);
        }
    }

    void display()
    {
        float theta = velocity.heading2D() + radians(90);
        pushMatrix();
        translate(location.x,location.y);
        rotate(theta);
        image(bird,0,0,size,size/2);
        popMatrix();
    }

    void addAcceleration(PVector a)
    {
        acceleration.add(a);
    }

}
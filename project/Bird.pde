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

    void move()
    {
        location.add(velocity);
        velocity.add(acceleration);
        acceleration = new PVector(0,0);
        if (location.x < size/2)
        {
            location.x = 3*width-size/2;
        }
        if (location.x > 3*width-size/2)
        {  
            location.x = size/2;
        }
        if (location.y < size/2)
        {
            location.y = height/2-size/2;
        }
        if (location.y > height/2-size/2)
        {
            location.y = size/2;
        }
        if (velocity.mag() > maxSpeed)
        {
            velocity.normalize();
            velocity.mult(maxSpeed);
        }
    }

    void display()
    {
        imageMode(CENTER);
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
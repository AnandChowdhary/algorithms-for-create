public class MassSpringDamper 
{
    PVector location;
    float acceleration;
    float velocity;
    float force;
    float theta;
    float mass;
    float damper;
    float spring;

    public MassSpringDamper () 
    {
        location = new PVector(0,0);
        theta = 0;
        mass = 20;
        force = 100;
        damper = 0.1;
        spring = 1;
    }
    
    void run()
    {
        update(0,0);
        display();
    }
    
    void display()
    {
        pushMatrix();
        translate(width/2,height);
        rotate(radians(theta));
        strokeWeight(5);
        line(location.x,location.y,0,-100);
        popMatrix();
    }
    
    void update(float f, float v)
    {
        acceleration = -force/mass;
        velocity += acceleration;
        theta += velocity;
        force = velocity*damper + theta*spring;
    }

}
public class MassSpringDamper 
{
    PVector location;
    PVector endloc;
    float acceleration;
    float velocity;
    float force;
    float theta;
    float mass;
    float damper;
    float spring;
    float size;

    public MassSpringDamper (float m, float s, float d, float f, float si) 
    {
        location = new PVector(0,0);
        endloc = new PVector(location.x, location.y-size);
        theta = 0;
        acceleration = 0;
        velocity = 0;
        mass = m;
        force = f;
        spring = s;
        damper = d;
        size = si;
    }
    
    void run(PVector l2, PVector l, float t, float f, float v)
    {
        update(t,f,v,l);
        display(l2);
    }
    
    void display(PVector l)
    {
        pushMatrix();
        translate(l.x,l.y);
        strokeWeight(3);
        line(location.x,location.y,endloc.x,endloc.y);
        popMatrix();
    }
    
    void update(float t, float f, float v, PVector l)
    { //<>//
        velocity += (f-force)/mass; //<>//
        theta += (velocity-v);
        force = (velocity-v)*damper + theta*spring;
        location = l.copy();
        endloc = new PVector(location.x, location.y-size);
        endloc.rotate(theta+t);
    }

}
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

    public MassSpringDamper (float m, float s, float d, float f, float si,PVector loc) 
    {
        location = loc.copy();
        theta = 0;
        acceleration = 0;
        velocity = 0;
        mass = m;
        force = f;
        spring = s;
        damper = d;
        size = si;
        endloc = new PVector(location.x, location.y-size);
    }
    
    void display(PVector b, PVector l, float t)
    {
        location = l.copy();
        PVector temp = new PVector(0,-size);
        temp.rotate(theta+t);
        endloc = PVector.add(location,temp);
        
        pushMatrix();
        translate(b.x,b.y);
        strokeWeight(3);
        line(location.x,location.y,endloc.x,endloc.y);
        popMatrix();
    }
    
    void update(float f, float v)
    { //<>//
        velocity += (f-force)/mass; //<>//
        theta += (velocity-v);
        force = (velocity-v)*damper + theta*spring;
    }

}
//A bubble as particle;

public class Bubble extends Particle
{
    color c;
    
    public Bubble (PVector l, PVector v, color c_) 
    {
        super(l,v);
        velocity = v.copy();
        velocity.normalize();
        velocity.rotate(radians(180));
        float angle = random(-40,40);
        velocity.rotate(radians(angle));
        velocity.mult(random(1,8));
        c = c_;
    }

    void display()
    {
        noStroke();
        fill(c,int(alpha*255));
        ellipse(location.x,location.y,radius,radius);
    }

}
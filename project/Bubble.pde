public class Bubble extends Particle
{

    public Bubble (PVector l, PVector v) 
    {
        super(l,v);
        velocity = v.copy();
        velocity.normalize();
        velocity.rotate(radians(180));
        float angle = random(-40,40);
        velocity.rotate(radians(angle));
        velocity.mult(random(1,8));
    }

    void display()
    {
        noStroke();
        fill(102,207,247,int(alpha*255));
        ellipse(location.x,location.y,radius,radius);
    }

}
public class Bubble extends Particle
{

    public Bubble (PVector l, PVector v) 
    {
        super(l,v);
    }

    void display()
    {
        noStroke();
        fill(102,207,247,int(alpha*255));
        ellipse(location.x,location.y,radius,radius);
    }

}
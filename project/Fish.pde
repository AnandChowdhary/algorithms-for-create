public class Fish extends Projectile
{

    public Fish () 
    {
        
    }

    void display()
    {
        if (active)
        {
            imageMode(CENTER);
            pushMatrix();
            translate(location.x,location.y);
            rotate(theta);
            image(fish,0,0,6*radius,4*radius);
            popMatrix();
        }
    }
}

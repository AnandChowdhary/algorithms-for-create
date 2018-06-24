public class Cyan extends Projectile
{
    ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
    int maxSize = 50;

    public Cyan() 
    {
        super();
    }

    void display()
    {
        if (active)
        {
            displayParticles();
            imageMode(CENTER);
            pushMatrix();
            translate(location.x,location.y);
            rotate(theta);
            image(fish4,0,0,6*radius,4*radius);
            popMatrix();
        }
    }

    void updateParticles()
    {
        if (bubbles.size() < maxSize)
        {
            fillList(bubbles.size());
        }
        for (int i = 0; i < bubbles.size(); i++)
        {
            bubbles.get(i).update();
            if (bubbles.get(i).remove())
            {
                bubbles.remove(i);
            }
        }
    } 

    void displayParticles()
    {
        for (int i = 0; i < bubbles.size(); i++)
        {
            bubbles.get(i).display();
        }   
    }

    void fillList(int x)
    {
        for (int i = x; i < maxSize; i++)
        {
            bubbles.add(new Bubble(location,velocity,color(73,242,213)));
        }
    }
}
public class Flame
{
    ArrayList<Particle> particles = new ArrayList<Particle>();
    
    public Flame()
    {
        for (int i = 0; i < 100; i++)
        {
            particles.add(new Particle());
        }
        xoff = random(1,5);
        xincrement = random(0.001,0.01);
    }

    void display()
    {
        for (int i = 0; i < particles.size(); i++)
        {
            particles.get(i).run();
            if (particles.get(i).check())
            {
                particles.remove(i);
            }
        }
        xoff += xincrement;
        xincrement = random(0.00001,0.0005);
        if (frameCount % 360 == 0)
        {
            xoff = random(-5,5);
        }
    }

    boolean check()
    {
        if (particles.size() < 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}
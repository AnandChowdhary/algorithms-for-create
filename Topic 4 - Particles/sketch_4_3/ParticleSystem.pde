public class ParticleSystem {
    ArrayList<Particle> particles = new ArrayList<Particle>();
    int maxSize = 100;
    PVector loc;
    int shape;

    public ParticleSystem () 
    {
        
    }

    void display()
    {
        loc = new PVector(constrain(mouseX,width/3,2*width/3),constrain(mouseY,height/3,2*height/3));

        for (int i = 0; i < particles.size(); i++)
        {
            particles.get(i).run();
            if (particles.get(i).remove())
            {
                particles.remove(i);
            }
        }
    }

    void fillList(int x)
    {
        for (int i = x; i < maxSize; i++)
        {
            particles.add(new Particle(loc, getVelocity(), getShape()));
        }
    }
    
    void click()
    {
        fillList(particles.size());
    }

    PVector getVelocity()
    {
        return new PVector(random(-10,10),random(-10,10));
    }

    int getShape()
    {
        return 0;
    }
}
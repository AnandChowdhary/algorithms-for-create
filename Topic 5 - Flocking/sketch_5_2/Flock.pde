public class Flock 
{
    ArrayList<Bird> birds = new ArrayList<Bird>();
    float maxAcc = 0.5;
    float seperation = 20;
    float avoWeight = 1.0;
    float cohArea = 60;
    float cohWeight = 0.2;
    float aliArea = 50;
    float aliWeight = 1.4;

    public Flock (int size) 
    {
        for (int i = 0; i < size; ++i) 
        {
            birds.add(new Bird(random(width/4,3*width/4),random(height/4,3*height/4),random(-1,1),random(-1,1)));            
        }
    }

    void run()
    {
        avoidance();
        coherance();
        alignment();
        for (int i = 0; i < birds.size(); ++i) 
        {
            birds.get(i).run();            
        }
    }
    
    void avoidance()
    {
        for (int i = 0; i < birds.size(); ++i) 
        {
            Bird a = birds.get(i);
            PVector avo = new PVector(0,0);

            for (int j = 0; j < birds.size(); ++j) 
            {
                Bird b = birds.get(j);
                if (a != b)
                {
                    float dist = PVector.dist(a.location,b.location);
                    if (dist < seperation)
                    {
                        PVector tmp = PVector.sub(a.location,b.location);
                        tmp.normalize();
                        if (dist < 1)
                        {
                            dist = 1;
                        }
                        tmp.div(dist);
                        avo.add(tmp);
                    }
                }
            }  
            avo.normalize();  
            avo.limit(maxAcc);
            avo.mult(avoWeight);
            a.addAcceleration(avo);
        }    
    }
    
    void coherance()
    {
        for (int i = 0; i < birds.size(); ++i) 
        {
            int counter = 1;
            Bird a = birds.get(i);
            PVector avLocation = a.location.copy();
            for (int j = 0; j < birds.size(); ++j) 
            {
                Bird b = birds.get(j);
                
                if (a != b)
                {
                    float dist = PVector.dist(a.location,b.location);
                    if (dist < cohArea)
                    {
                        avLocation.add(b.location);
                        counter++;
                    }
                }
            } 
            avLocation.div(counter);
            PVector coh = PVector.sub(avLocation,a.location);
            coh.normalize();
            coh.limit(maxAcc);
            coh.mult(cohWeight);
            a.addAcceleration(coh);   
        }
    }
    
    void alignment()
    {
         for (int i = 0; i < birds.size(); ++i) 
        {
            Bird a = birds.get(i);
            PVector avVelocity = a.velocity.copy();
            for (int j = 0; j < birds.size(); ++j) 
            {
                Bird b = birds.get(j);
                
                if (a != b)
                {
                    float dist = PVector.dist(a.location,b.location);
                    if (dist < aliArea)
                    {
                        avVelocity.add(b.velocity);
                    }
                }
            } 

            avVelocity.normalize();
            avVelocity.limit(maxAcc);
            avVelocity.mult(aliWeight);
            a.addAcceleration(avVelocity);
        }   
    }
}
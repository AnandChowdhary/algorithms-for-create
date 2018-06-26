public class Flock 
{
    ArrayList<Bird> birds = new ArrayList<Bird>();
    //Variables for the different weights and distances 
    float maxAcc = 0.5;
    float seperation = 20;
    float avoWeight = 1.0;
    float cohArea = 60;
    float cohWeight = 0.2;
    float aliArea = 50;
    float aliWeight = 1.4;
    float doggieDist = 5;

    public Flock (int size) 
    {
        //creates all the birds within a specified area.
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
    
    //calculate the avoidance for each bird
    void avoidance()
    {
        //picks one bird
        for (int i = 0; i < birds.size(); ++i) 
        {
            Bird a = birds.get(i);
            PVector avo = new PVector(0,0);
            
            //compare it to all the other birds
            for (int j = 0; j < birds.size(); ++j) 
            {
                Bird b = birds.get(j);
                if (a != b)
                {
                    float dist = PVector.dist(a.location,b.location);
                    
                    //if the second bird is within a specified range
                    //adds acceleration in the oposite direction
                    //which is dependend on the distance
                    if (dist < seperation)
                    {
                        PVector tmp = PVector.sub(a.location,b.location);
                        tmp.normalize();
                        if (dist < 1)
                        {
                            dist = 1;
                        }
                        tmp.div(dist);
                        //add the acceleration to the overall acceleation
                        avo.add(tmp);
                    }
                }
            }  
            //normalize it and litmit it
            avo.normalize();  
            avo.limit(maxAcc);
            //multiply by weight
            avo.mult(avoWeight);
            a.addAcceleration(avo);
            
            //adds acceleration for avoiding the dog
            PVector avoDog = new PVector(0,0);

            boolean right = doggie.location.x + doggie.sizex/2 < a.location.x - a.size - doggieDist;
            boolean left = doggie.location.x - doggie.sizex/2 > a.location.x + a.size + doggieDist;
            boolean up = doggie.location.y - doggie.sizey/2 > a.location.y + a.size + doggieDist;
            boolean down = doggie.location.y + doggie.sizey/2 < a.location.y - a.size - doggieDist;
            
            if (!right && !left && !up && !down)
            {
                avoDog = PVector.sub(a.location,doggie.location);
                avoDog.normalize();
                a.addAcceleration(avoDog);
            }
        }    
    }
    
    //calculates the coherance for each bird
    void coherance()
    {
        //picks one bird
        for (int i = 0; i < birds.size(); ++i) 
        {
            int counter = 1;
            Bird a = birds.get(i);
            PVector avLocation = a.location.copy();
            //compare it to all the other birds
            for (int j = 0; j < birds.size(); ++j) 
            {
                Bird b = birds.get(j);
                
                if (a != b)
                {
                    float dist = PVector.dist(a.location,b.location);
                    //if the second bird is within a set range
                    if (dist < cohArea)
                    {
                        //add the location to an average location
                        avLocation.add(b.location);
                        counter++;
                    }
                }
            } 
            //calculate the average
            avLocation.div(counter);
            PVector coh = PVector.sub(avLocation,a.location);
            //normalize and multiply with weight
            coh.normalize();
            coh.limit(maxAcc);
            coh.mult(cohWeight);
            a.addAcceleration(coh);   
        }
    }
    
    //calculates the allignment for each bird
    void alignment()
    {
        //picks one bird
        for (int i = 0; i < birds.size(); ++i) 
        {
            Bird a = birds.get(i);
            PVector avVelocity = a.velocity.copy();
            //compare it to all the other birds
            for (int j = 0; j < birds.size(); ++j) 
            {
                Bird b = birds.get(j);
                
                if (a != b)
                {
                    float dist = PVector.dist(a.location,b.location);
                    //if the second bird is within a set range
                    if (dist < aliArea)
                    {
                        //adds the velocity to the average velocity
                        avVelocity.add(b.velocity);
                    }
                }
            } 
            
            //normalize and multiply with weight
            avVelocity.normalize();
            avVelocity.limit(maxAcc);
            avVelocity.mult(aliWeight);
            a.addAcceleration(avVelocity);
        }   
    }
}
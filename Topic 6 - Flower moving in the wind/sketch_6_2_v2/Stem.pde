public class Stem 
{
    PVector base;
    ArrayList<MassSpringDamper> msd = new ArrayList<MassSpringDamper>();
    
    float mass = 1;
    float spring = 0.01;
    float damper = 0.1;
    float force = 0.1;
    float size = 150;
    float nr = 5;
    
    public Stem () 
    {
       base = new PVector(width/2,height);
       for(int i = 0; i < nr; i++)
       {         
           if (i < nr - 1)
           {
               if (i == 0)
               {
                   msd.add(new MassSpringDamper(mass, spring, damper, 0, size,new PVector(0,0)));                                    
               }
               else
               {
                   msd.add(new MassSpringDamper(mass, spring, damper, 0, size,new PVector(0,-size*i)));
               }
           }
           
           if (i == nr - 1)
           {
               msd.add(new MassSpringDamper(mass, spring, damper, force, size,new PVector(0,-size*i)));
           }  
       }
    }

    void run()
    {
        for (int i = msd.size()-1; i >= 0; i--)
        {
            if (i == 0)
            {
                msd.get(i).update(msd.get(i+1).force,0);
            }
            else if (i < msd.size() - 1)
            {
                msd.get(i).update(msd.get(i+1).force,msd.get(i-1).velocity);
            }
            else
            {
                msd.get(i).update(0,msd.get(i-1).velocity);
            }
        }
        float t = 0;
        for (int i = 0; i < msd.size(); i++)
        {
            if (i == 0)
            {
                msd.get(i).display(base,new PVector(0,0),0);
            }
            else 
            {
                t += msd.get(i-1).theta;
                msd.get(i).display(base,msd.get(i-1).endloc,t);
            }
        }
    }
}
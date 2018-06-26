public class Stem 
{
    PVector base;
    ArrayList<MassSpringDamper> msd = new ArrayList<MassSpringDamper>();
    
    float mass = 1;
    float spring = 0.3;
    float damper = 0.1;
    float force = 0.2;
    float size = 100;
    
    public Stem () 
    {
       base = new PVector(width/2,height);
       for(int i = 0; i < 6; i++)
       {
           //msd.add(new MassSpringDamper(5,0.1,0.1,20,size));
         
           if (i < 5)
           msd.add(new MassSpringDamper(mass, spring, damper, 0, size));
           if (i == 5)
           msd.add(new MassSpringDamper(mass, spring, damper, force, size));
        
           
       }
    }

    void run()
    {
      
        //for (int i = 0; i < msd.size(); i++)
        for (int i = msd.size()-1; i >= 0; i--)
        {
          println(i, msd.get(i).force, msd.get(i).velocity);
            if (i == 0)
            {
                msd.get(i).run(base,new PVector(0,0),0,msd.get(i+1).force,0);
                //msd.get(i).run(base,new PVector(0,0),0,0);
            }
            else if (i < msd.size() - 1)
            {
                msd.get(i).run(base,msd.get(i-1).endloc,msd.get(i-1).theta,msd.get(i+1).force,msd.get(i-1).velocity);
                //msd.get(i).run(base,msd.get(i-1).endloc,0,0);
                //println(msd.get(i+1).force);
            }
            else
            {
                msd.get(i).run(base,msd.get(i-1).endloc,msd.get(i-1).theta,0,msd.get(i-1).velocity);
                //msd.get(i).run(base,msd.get(i-1).endloc,0,0);
            }
          println(i, msd.get(i).force, msd.get(i).velocity);
        }
    }
}
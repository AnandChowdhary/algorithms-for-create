public class Stem 
{
    PVector base;
    ArrayList<MassSpringDamper> msd = new ArrayList<MassSpringDamper>();
    
    float mass = 0.5;
    float spring = 0.02;
    float damper = 0.2;
    float force = 0;
    float segmentSize;
    float size;
    float nr;
    
    public Stem (float x, float y,float size_, float nr_) 
    {
        size = size_;
        nr = nr_;
        segmentSize = size/nr;
        base = new PVector(x,height-y);
        
        //create all segments
        for(int i = 0; i < nr; i++)
        {         
            if (i < nr - 1)
            {
                if (i == 0)
                 {
                     msd.add(new MassSpringDamper(mass, spring, damper, 0, segmentSize,new PVector(0,0)));                                    
                 }
                 else
                 {
                     msd.add(new MassSpringDamper(mass, spring, damper, 0, segmentSize,new PVector(0,-segmentSize*i)));
                 }
             }
         }
    }

    void run()
    {
        //pass the forces down from above and the velocity from below
        for (int i = msd.size()-1; i >= 0; i--)
        {
            if (i == 0)
            {
                msd.get(i).update(msd.get(i+1).force+force,0);
            }
            else if (i < msd.size() - 1)
            {
                msd.get(i).update(msd.get(i+1).force+force,msd.get(i-1).velocity);
            }
            else
            {
                msd.get(i).update(force,msd.get(i-1).velocity);
            }
        }
        force = 0;
        float angle = 0;
        //set the angle for each segment
        for (int i = 0; i < msd.size(); i++)
        {
            if (i == 0)
            {
                msd.get(i).display(base,new PVector(0,0),0);
            }
            else 
            {
                angle += msd.get(i-1).theta;
                msd.get(i).display(base,msd.get(i-1).endloc,angle);
            }
        }
    }
    
    void addWind(float f)
    {
        force = f;
    }
}
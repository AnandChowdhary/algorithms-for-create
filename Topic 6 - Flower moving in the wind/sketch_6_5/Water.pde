class Water
{
    MSD[] droplets;
    
    float yPos;
    float mass;
    float spring;
    float damper;
    float force;
    float size;
    
    
    public Water()
    {
        mass = 5;
        spring = 0.2;
        damper = 0.2;
        force = 0;
        size = 10;
        droplets = new MSD[int(width/size)];
        yPos = height - height/4;
        fillArray();
    }
    
    void fillArray()
    {
        int x = int(size/2);
        for (int i = 0; i < droplets.length; i++)
        {    
            if (i == int(droplets.length/2))
            {
                droplets[i] = new MSD(x,yPos,mass,spring,damper,25,size);
            }
            else
            {
                droplets[i] = new MSD(x,yPos,mass,spring,damper,force,size);
            }
            x += size;
        }
    }
    
    void display()
    {
        noStroke();
        fill(#A6FCFC);
        beginShape();
        vertex(0,height);
        vertex(0,yPos);
        
        for (int i = 0; i < droplets.length; i++)
        {
            if (i == 0)
            {
                droplets[i].run(0,(droplets[i+1].level-droplets[i].level)*spring);
            }
            else if (i < droplets.length -1)
            {
                droplets[i].run((droplets[i-1].level-droplets[i].level)*spring,(droplets[i+1].level-droplets[i].level)*spring);
            }
            else if (i == droplets.length - 1)
            {
                droplets[i].run((droplets[i-1].level-droplets[i].level)*spring,0);
            }
        }
        vertex(width,yPos);
        vertex(width,height);
        endShape();
    }
}
class Wind
{
    int counter;
    float force;
    boolean done = false;
    int speed;
    
    public Wind(float force_, int speed_)
    {
        force = force_;
        speed = 61 - speed_;
        constrain(speed,1,60);
    }
    
    void run()
    {
        if (counter < nrStalksRow)
        {
            for (int i = 0; i < rows; i++)
            {
                float f = random(force/2,2*force);
                stalks[counter+i*nrStalksRow].addWind(f);
            }
            if (frameCount % speed == 0)
            counter++;
        }
        else
        {
            done = true;
        }
    }
}
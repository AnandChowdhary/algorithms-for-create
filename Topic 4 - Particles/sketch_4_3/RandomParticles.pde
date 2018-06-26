public class RandomParticles extends ParticleSystem
{
    int maxSize = 200;

    public RandomParticles () 
    {

    }

    int getShape()
    {
        return int(random(0,4));
    }
}

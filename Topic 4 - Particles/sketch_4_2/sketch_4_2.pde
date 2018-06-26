ArrayList<Particle> particles = new ArrayList<Particle>();
int maxSize = 100;
PVector loc;

void setup() 
{
    size(1500,1000);
}

void draw() 
{
    background(255);
    loc = new PVector(constrain(mouseX,width/3,2*width/3),constrain(mouseY,height/3,2*height/3));
    
    for (int i = 0; i < particles.size(); i++)
    {
        particles.get(i).run();
        if (particles.get(i).remove())
        {
            particles.remove(i);
        }
    }
    println(particles.size());
}

void fillList(int x)
{
    for (int i = x; i < maxSize; i++)
    {
        particles.add(new Particle(loc));
    }
}

void mouseClicked()
{
    fillList(particles.size());
}
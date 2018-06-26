/*
  Makes particles move as if they were being shot from a rocket for example.
  The stream of particles follow the mouse of the user, but is restricted to a certain area.
  made by Wouter Couwenbergh
  June 2018
*/


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
    //restricts the mousex en mousey to a certain area
    loc = new PVector(constrain(mouseX,width/3,2*width/3),constrain(mouseY,height/3,2*height/3));
    //if the nr of particles is below the desired level, fill the list up to the max
    if (particles.size() < maxSize)
    {
        fillList(particles.size());
    }
    //run the particles, move and display them.
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

//fills the arraylist to the desired level
void fillList(int x)
{
    for (int i = x; i < maxSize; i++)
    {
        particles.add(new Particle(loc));
    }
}
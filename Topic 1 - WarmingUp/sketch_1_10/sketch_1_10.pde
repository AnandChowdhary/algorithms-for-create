int maxconfetti=30;
Confetti[] confs=new Confetti[maxconfetti]; //this makes an array of 30 confettis

int windowsize=500;


void setup()
{
    size(500,500);
    // here we fill the array with new objects: we also need to make the objects
    for (int j=0; j<maxconfetti; j++)
    {
        confs[j]= new Confetti();
    }
}

void draw()
{
    background(0);
    for (int j=0; j<maxconfetti; j++)
    {
        confs[j].move();
        confs[j].display();
    }
}
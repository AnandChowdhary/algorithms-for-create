int maxconfetti=30;
Confetti[] confs=new Confetti[maxconfetti]; //this makes an array of 30 confettis

void setup()
{
    size(1000,1000);
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
        for (int i = 0; i < maxconfetti; i++)
        {
            if (i != j)
            {
                if (PVector.dist(confs[j].location, confs[i].location) <= (confs[i].radius + confs[j].radius))
                {
                    if (PVector.dist(confs[j].location, confs[i].location) < 0.9*(confs[i].radius + confs[j].radius))
                    {
                        confs[j].location = new PVector(int(random(confs[j].radius,width-confs[j].radius)),int(random(confs[j].radius,width-confs[j].radius)));
                        confs[i].location = new PVector(int(random(confs[i].radius,width-confs[i].radius)),int(random(confs[i].radius,width-confs[i].radius)));
                    }
                    float jPosX = confs[j].location.x;
                    float jPosY = confs[j].location.y;
                    float iPosX = confs[i].location.x;
                    float iPosY = confs[i].location.y;
                    PVector jVelocity = confs[j].velocity;
                    PVector iVelocity = confs[i].velocity;
                    PVector axisj = new PVector(iPosX - jPosX, iPosY - jPosY);
                    PVector axisi = new PVector(jPosX - iPosX, jPosY - iPosY);
                    
                    float lengthAxisj = 1/pow(axisj.mag(),2);
                    float lengthAxisi = 1/pow(axisi.mag(),2);

                    float dotj = axisj.dot(jVelocity);
                    float doti = axisi.dot(iVelocity);

                    float scalarj = dotj * lengthAxisj;
                    float scalari = doti * lengthAxisi;
                    
                    PVector aj = PVector.mult(axisj, scalarj);
                    PVector ai = PVector.mult(axisi, scalari);
                    
                    PVector newJVelocity = jVelocity.sub(aj);
                    PVector newIVelocity = iVelocity.sub(ai);

                    confs[j].velocity = new PVector(newJVelocity.x + ai.x, newJVelocity.y + ai.y);
                    confs[i].velocity = new PVector(newIVelocity.x + aj.x, newIVelocity.y + aj.y);
                                       
                }
            }
        }
    }
}
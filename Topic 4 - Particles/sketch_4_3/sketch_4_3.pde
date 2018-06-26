RandomParticles test = new RandomParticles();

void setup() 
{
    size(2000,1500);
}

void draw() 
{
    background(255);
    test.display();
}


void mouseClicked()
{
    test.click();
}
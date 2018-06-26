ArrayList<Flame> flames = new ArrayList<Flame>();

void setup() 
{
    size(1600,1000);
    background(255);
    fillLists();
}

void draw() 
{
    noStroke();
    fill(255,50);
    rect(0,0,width,height);
    
    for (int i = 0; i < flames.size(); i++)
    {
        flames.get(i).display();
    }
}

void fillLists()
{
    float x = -25;
    
    for (int i = 0; i < 10; i++)
    {
        flames.add(new Flame(1,x));
        x += 50/10;
    }
    
    x = -20;
    for (int i = 0; i < 7; i++)
    {
        flames.add(new Flame(2,x));
        x += 40/7;
    }
    
    x = -15;
    for (int i = 0; i < 5; i++)
    {
        flames.add(new Flame(4,x));
        x += 30/5;
    }
}
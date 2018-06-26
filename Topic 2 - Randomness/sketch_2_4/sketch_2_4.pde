ArrayList<Dots> blobs = new ArrayList<Dots>();
boolean done = false;

void setup() 
{
    size(1000,1000);
}

void draw() 
{
    background(255);
    noStroke();
    if (!done)
    {
        addBlobs(25,2500,5,50);
        println(blobs.size());
    }
    displayBobs();
}

void displayBobs()
{
    for (int i = 0; i < blobs.size(); ++i) 
    {
        blobs.get(i).display();
    }
}

void addBlobs(int nr, int tries, int minRadius, int maxRadius)
{
    for (int j = 0; j < nr; ++j) 
    {
        PVector location = new PVector(int(random(0,width)), int(random(0,height)));
        int radius = int(random(minRadius,maxRadius));
        int red = int(map(radius,minRadius,maxRadius,200,256));
        color c = color(red,0,0);

        if (blobs.size() != 0)
        {
            boolean placeAvailable = true;
            for (int i = 0; i < blobs.size(); ++i) 
            {
                if (PVector.dist(blobs.get(i).location,location) <= (blobs.get(i).radius/2 + radius/2))
                {
                    placeAvailable = false;  
                }    
            }
            if (placeAvailable)
            {
                blobs.add(new Dots(location, radius,c));
                println("available");
            }
            else
            {
                int counter = 0;
                while (!placeAvailable && counter < tries)
                {
                    location = new PVector(int(random(0,width)), int(random(0,height)));
                    radius = int(random(minRadius,maxRadius));
                    
                    boolean newPlace = true;

                    for (int i = 0; i < blobs.size(); ++i) 
                    {
                        if (PVector.dist(blobs.get(i).location,location) < (blobs.get(i).radius/2 + radius/2))
                        {
                            newPlace = false;  
                            println("false");
                            break;
                        }  
                    }

                    placeAvailable = newPlace;  
                    counter++;
                    println(counter);
                }
                if (counter < tries)
                {
                    blobs.add(new Dots(location, radius,c));
                }
                else
                {
                    done = true;
                    println("done");
                    break;
                }
            }
            
        }
        else
        {
            blobs.add(new Dots(location, radius,c));   
        }
    }
}

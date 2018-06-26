/*
  Fills the sketch with dots that get smaller as the available space shrinks.
  made by Wouter Couwenbergh
  June 2018
*/

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
    //while it's not done adding new spheres, it adds new ellipses.
    if (!done)
    {
        addBlobs(25,2500,5,50);
        //println(blobs.size());
    }
    displayBobs();
}

//displays all the blobs
void displayBobs()
{
    for (int i = 0; i < blobs.size(); ++i) 
    {
        blobs.get(i).display();
    }
}


//adds a new blob by finding a random position. if this location is already
//occupied, it will try tries amount of times. if it then still hasn't found
//a place it is done.
void addBlobs(int nr, int tries, int minRadius, int maxRadius)
{
    for (int j = 0; j < nr; ++j) 
    {
        //get a random location, width and color depending on the radius
        PVector location = new PVector(int(random(0,width)), int(random(0,height)));
        int radius = int(random(minRadius,maxRadius));
        int red = int(map(radius,minRadius,maxRadius,200,256));
        color c = color(red,0,0);
        
        //if there are already blobs it will check if the location is free, 
        //otherwise it will just add one
        if (blobs.size() != 0)
        {
            boolean placeAvailable = true;
            //checks if this place is available
            for (int i = 0; i < blobs.size(); ++i) 
            {
                if (PVector.dist(blobs.get(i).location,location) <= (blobs.get(i).radius/2 + radius/2))
                {
                    placeAvailable = false;  
                }    
            }
            //if it is indeed available it adds a blob
            if (placeAvailable)
            {
                blobs.add(new Dots(location, radius,c));
                println("available");
            }
            //otherwise it tries "tries" nr of times
            else
            {
                int counter = 0;
                //while still not having found a place and the nr of tries is lower
                //than the maximum it will try again.
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
                //if it reaches here it has either found a place or not.
                //if the nr of tries is lower than the max it has.
                if (counter < tries)
                {
                    blobs.add(new Dots(location, radius,c));
                }
                //if not then it has not found a place and is thus done.
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
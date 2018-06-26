/*
  A program to simulate a dice toss, also keeping track of the trown faces.
  made by Wouter Couwenbergh
  June 2018
*/

ArrayList<Integer> occurances = new ArrayList<Integer>();

void setup() 
{
    size(100,100);
    initializeOccurances();
}

void draw() 
{
    
}

void mousePressed()
{
    //add a new random number to the arrayList
    randomNumber();
    
    //print all the occurance of the dice
    for (int i = 0; i < occurances.size(); ++i) 
    {
        println("Number of occurances of " + (i+1) + " = " + occurances.get(i));
    }
}

void randomNumber()
{
    //get a random number and print it
    int nr = int(random(1,7));
    println("Last random number: " + nr);

    //add the random number to the occurances list
    int index = nr-1;
    int newValue = occurances.get(index) + 1;
    occurances.set(index,newValue);
}

void initializeOccurances()
{
    for (int i = 0; i < 6; ++i) 
    {
        occurances.add(0);
    }
}
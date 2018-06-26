/*
  A program to simulate a 10000 dice tosses, also keeping track of the trown faces.
  In this version, 6 has a slight preference.
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
    //run randomNumber x amount of time
    setOfRandomNumbers(100000);
    
    //print all the occurance of the dice
    for (int i = 0; i < occurances.size(); ++i) 
    {
        println("Number of occurances of " + (i+1) + " = " + occurances.get(i));
    }
}

void setOfRandomNumbers(int e)
{
    for (int i = 0; i < e; ++i) 
    {
        //add a new random number to the arrayList
        randomNumber();
    }
}

void randomNumber()
{
    //get a random number and print it
    int nr = int(random(1,8));
    //if nr is higher than 6, it is set to six, giving it a slight preference.
    if (nr > 6)
    {
        nr = 6;
    }
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
ArrayList<Integer> numbers = new ArrayList<Integer>();
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
    setOfRandomNumbers(100000);
    for (int i = 0; i < occurances.size(); ++i) 
    {
        println("Number of occurances of " + (i+1) + " = " + occurances.get(i));
    }
}

void setOfRandomNumbers(int e)
{
    for (int i = 0; i < e; ++i) 
    {
        randomNumber();
    }
}

void randomNumber()
{
    int nr = int(random(1,7));
    numbers.add(nr);
    println("Last random number: " + nr);

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